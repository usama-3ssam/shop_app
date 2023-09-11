import 'package:shop_app/model/login_model.dart';

abstract class ShopLoginStates {}

class ShopLoginInitialStates extends ShopLoginStates {}

class ShopLoginLoadingStates extends ShopLoginStates {}

class ShopLoginSuccessStates extends ShopLoginStates {
  final ShopLoginModel loginModel;
  ShopLoginSuccessStates(this.loginModel);
}

class ShopLoginErrorStates extends ShopLoginStates {
  final String error;
  ShopLoginErrorStates(this.error);
}

class ShopChangePasswordVisibilityStates extends ShopLoginStates {}
