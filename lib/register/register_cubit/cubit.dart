// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/model/login_model.dart';
import 'package:shop_app/network/end_points/end_points.dart';
import 'package:shop_app/network/remote/dio_helper.dart';
import 'package:shop_app/register/register_cubit/states.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitialStates());
  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  ShopLoginModel? loginModel;

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(ShopRegisterLoadingStates());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'email': email,
        'name': name,
        'password': password,
        'phone': phone,
      },
    ).then((value) {
      print(value.data);
      loginModel = ShopLoginModel.fromJson(value.data);
      emit(ShopRegisterSuccessStates(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopRegisterErrorStates(error.toString()));
    });
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ShopRegisterChangePasswordVisibilityStates());
  }
}
