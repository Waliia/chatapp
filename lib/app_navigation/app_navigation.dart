import 'package:chat_app1/pages/chatpage/chat_page.dart';
import 'package:chat_app1/pages/signinpage/signin_page.dart';
import 'package:chat_app1/pages/signuppage/signup_page.dart';
import 'package:flutter/material.dart';

class AppNavigation {
  static Route? buildPage(RouteSettings settings) {
    switch (settings.name) {
      case SigninPage.PAGE_NAME:
        {
          return MaterialPageRoute(
              builder: (context) => SigninPage(), settings: settings);
        }
      case SignupPage.PAGE_NAME:
        {
          return MaterialPageRoute(
              builder: (context) => SignupPage(), settings: settings);
        }
      case HomeScreen.PAGE_NAME:
        {
          return MaterialPageRoute(
              builder: (context) => HomeScreen(), settings: settings);
        }
      default:
        {}
    }
  }
}
