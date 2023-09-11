import 'package:flutter/material.dart';
import 'package:shop_app/login/shop_login_screen.dart';
import 'package:shop_app/network/local/cache_helper.dart';

void signOut(context) {
  CacheHelper.removeData(
    key: 'token',
  ).then((value) {
    if (value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => ShopLoginScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    }
  });
}

dynamic token = '';
const defaultColor = Palette.kToDark;

class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xff2b5d89,
    <int, Color>{
      50: Color(0xf0011e50), //10%
      100: Color(0xff3a64b7), //20%
      200: Color(0xff3237a0), //30%
      300: Color(0xff2b5d89), //40%
      400: Color(0xff245d73), //50%
      500: Color(0xff1d485c), //60%
      600: Color(0xff281645), //70%
      700: Color(0xff0e1a2e), //80%
      800: Color(0xff070b17), //90%
      900: Color(0xff000000), //100%
    },
  );
}
