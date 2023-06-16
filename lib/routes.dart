import 'package:antiques_store2/Home/Akun.dart';
import 'package:antiques_store2/Home/Home.dart';
import 'package:antiques_store2/Login.dart';
import 'package:antiques_store2/LupaPassword.dart';
import 'package:antiques_store2/Register.dart';
import 'package:antiques_store2/Register/SignUpWidget.dart';
import 'package:antiques_store2/SplashScreen.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  // Login.routeName: (context) => Login(),
  // SignUpWidget.routeName: (context) => SignUpWidget(),
  LupaPassword.routeName: (context) => LupaPassword(),
  Home.routeName: (context) => Home(),
  Akun.routeName: (context) => Akun(),
};
