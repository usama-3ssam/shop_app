import 'package:shop_app/model/change_favorites_model.dart';
import 'package:shop_app/model/login_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopChangeBottomNavState extends ShopStates {}

class ShopLoadingHomeDataState extends ShopStates {}

class ShopSuccessHomeDataState extends ShopStates {}

class ShopErrorHomeDataState extends ShopStates {}

class ShopSuccessCategoriesState extends ShopStates {}

class ShopErrorCategoriesState extends ShopStates {}

class ShopSuccessFavoritesState extends ShopStates {
  final ChangeFavoritesModel model;

  ShopSuccessFavoritesState(this.model);
}

class ShopLoadingChangeFavoritesState extends ShopStates {}

class ShopErrorFavoritesState extends ShopStates {}

class ShopLoadingGetFavoritesState extends ShopStates {}

class ShopSuccessGetFavoritesState extends ShopStates {}

class ShopErrorGetFavoritesState extends ShopStates {}

class ShopLoadingUserDataState extends ShopStates {}

class ShopSuccessUserDataState extends ShopStates {
  final ShopLoginModel shopLoginModel;

  ShopSuccessUserDataState(this.shopLoginModel);
}

class ShopErrorUserDataState extends ShopStates {}

class ShopLoadingUpdateUserState extends ShopStates {}

class ShopOnClickProductState extends ShopStates {}

class ShopSuccessUpdateUserState extends ShopStates {
  final ShopLoginModel shopLoginModel;

  ShopSuccessUpdateUserState(this.shopLoginModel);
}

class ShopErrorUpdateUserState extends ShopStates {}

class ShopLoadingGetCartsState extends ShopStates {}

class ShopSuccessGetCartsState extends ShopStates {}

class ShopErrorGetCartsState extends ShopStates {}

class ShopLoadingChangeCartsState extends ShopStates {}

class ShopSuccessCartsState extends ShopStates {}

class ShopErrorCartsState extends ShopStates {}

class QuantityPlusState extends ShopStates {
  final int counter;

  QuantityPlusState(this.counter);
}

class QuantityMinusState extends ShopStates {
  final int counter;
  QuantityMinusState(this.counter);
}

class ShopChangeColorsState extends ShopStates {}
