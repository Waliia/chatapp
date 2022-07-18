import 'package:chat_app/pages/sign%20in/sign_in_view.dart';
import 'package:chat_app/pages/sign%20up/sign_up_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigation{

  static Route? buildRoutes(RouteSettings? settings){
    switch(settings!.name){
      case SigninView.PAGE_NAME:{
        return CupertinoPageRoute(
          builder: (context) => SigninView(),
          settings: settings,
          title: settings.name,
        );
        //PageRouteBuilder(pageBuilder: )
        //return MaterialPageRoute(builder: (context) => SigninView(),settings: settings,fullscreenDialog: true,maintainState: true);
      }
      case Signup.PAGE_NAME:{
        return CupertinoPageRoute(
          builder: (context)=>Signup(),
          title: settings.name,
          settings: settings,
          fullscreenDialog: true,
        );
       // return MaterialPageRoute(builder: (context) => Signup(),settings: settings,fullscreenDialog: true,maintainState: true);
      }
      default:{
        print('there is a problem');
      }
    }
  }
}

