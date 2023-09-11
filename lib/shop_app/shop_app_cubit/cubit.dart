// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/model/cart_model.dart';
import 'package:shop_app/model/categories_model.dart';
import 'package:shop_app/model/change_carts-model.dart';
import 'package:shop_app/model/change_favorites_model.dart';
import 'package:shop_app/model/favorites_model.dart';
import 'package:shop_app/model/home_model.dart';
import 'package:shop_app/model/login_model.dart';
import 'package:shop_app/network/end_points/end_points.dart';
import 'package:shop_app/network/remote/dio_helper.dart';
import 'package:shop_app/screens/cateogries_screen.dart';
import 'package:shop_app/screens/favorites_screen.dart';
import 'package:shop_app/screens/products_screen.dart';
import 'package:shop_app/screens/settings_screen.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/shop_app/shop_app_cubit/states.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());
  static ShopCubit get(context) => BlocProvider.of(context);

  List<Widget> bottomScreens = [
    const ProductsScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    SettingsScreen(),
  ];

  int currentIndex = 0;
  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel? homeModel;
  Map<int, bool> favorites = {};
  Map<int, bool> carts = {};

  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data.products.forEach((element) {
        favorites.addAll({element['id']: element['in_favorites']});
      });
      homeModel!.data.products.forEach((element) {
        carts.addAll({element['id']: element['in_cart']});
      });
      // print(carts.toString());
      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModels? categoriesModels;

  void getCategories() {
    DioHelper.getData(
      url: GET_CATEGORIES,
    ).then((value) {
      categoriesModels = CategoriesModels.fromJson(value.data);
      emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;

  void changeFavorites(int idProducts) {
    favorites[idProducts] = !favorites[idProducts]!;
    emit(ShopLoadingChangeFavoritesState());
    DioHelper.postData(
      url: FAVORITES,
      data: {
        'product_id': idProducts,
      },
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      if (!changeFavoritesModel!.status!) {
        favorites[idProducts] = !favorites[idProducts]!;
      } else {
        getFavorites();
      }
      emit(ShopSuccessFavoritesState(changeFavoritesModel!));
    }).catchError((error) {
      favorites[idProducts] = !favorites[idProducts]!;
      emit(ShopErrorFavoritesState());
    });
  }

  FavoritesModel? favoritesModel;

  void getFavorites() {
    emit(ShopLoadingGetFavoritesState());
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      emit(ShopSuccessGetFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetFavoritesState());
    });
  }

  ShopLoginModel? userModel;

  void getUserDate() {
    emit(ShopLoadingUserDataState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      emit(ShopSuccessUserDataState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }

  void updateUserDate({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(ShopLoadingUpdateUserState());
    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      emit(ShopSuccessUpdateUserState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUpdateUserState());
    });
  }

  int? index;
  void onClickItem(int idProduct) {
    index = homeModel!.data.products
        .indexWhere((element) => element['id'] == idProduct);

    emit(ShopOnClickProductState());
  }

  CartModel? cartModel;

  void getCarts() {
    emit(ShopLoadingGetCartsState());
    DioHelper.getData(
      url: CARTS,
      token: token,
    ).then((value) {
      cartModel = CartModel.fromJson(value.data);
      // print('Get Carts Hereeeeeeeeee ==> ${cartModel.toString()}');
      emit(ShopSuccessGetCartsState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetCartsState());
    });
  }

  ChangeCartsModel? changeCartsModel;

  void changeCarts(int productsId) {
    carts[productsId] = !carts[productsId]!;
    emit(ShopLoadingChangeCartsState());
    DioHelper.postData(
      url: CARTS,
      data: {
        'product_id': productsId,
      },
      token: token,
    ).then((value) {
      changeCartsModel = ChangeCartsModel.fromJson(value.data);
      if (!changeCartsModel!.status!) {
        carts[productsId] = !carts[productsId]!;
      } else {
        getCarts();
      }
      // print(cartModel!.data!.cartItems[0]['product']);
      emit(ShopSuccessCartsState());
    }).catchError((error) {
      carts[productsId] = !carts[productsId]!;
      emit(ShopErrorCartsState());
    });
  }

  int counter = 1;

  void plus() {
    counter++;
    emit(QuantityPlusState(counter));
  }

  void minus() {
    counter--;
    emit(QuantityMinusState(counter));
  }

  int currentColor = 0;

  List<Color> colors = [Colors.red, Colors.white, Colors.black, Colors.grey];
  void changeColors(int index) {
    currentColor = index;
    emit(ShopChangeColorsState());
  }
}
