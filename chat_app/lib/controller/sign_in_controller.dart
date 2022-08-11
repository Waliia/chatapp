

import 'package:chat_app/pages/sign%20up/sign_up_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigninController {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future signInBtnClick({ required BuildContext context,
      required GlobalKey<FormFieldState> emailKey ,
      required GlobalKey<FormFieldState> passwordKey,
      required GlobalKey<FormFieldState> nameKey,
      required TextEditingController email ,
      required TextEditingController passwoord,
      required TextEditingController name,} ) async{
          if(emailKey.currentState!.validate() && passwordKey.currentState!.validate()){
           String? uuid   = await   signinWithEmailAndPassword(email: email.text, pass: passwoord.text, context: context);
           if(uuid!=null){
             //Navigator.pushNamed(context, pending);
           }
          }
  }

  static void signInGoogleBtnClick(BuildContext context,var emailKey , var passwordKey ) async{
         String? uid = await signinWithGoogle(context);
         if(uid!=null){
          // Navigator.pushNamed(context, pending);
         }
  }

  static void registerNowClick(BuildContext context ,
      ){
         Navigator.pushNamed(context, Signup.PAGE_NAME,arguments: 'hello world');
  }


  static Future<String?> signinWithEmailAndPassword({required String email ,required String pass,required BuildContext context}) async{
    String? uidd ;
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: pass);
      User? user = credential.user;
      user!=null? uidd = user.uid:uidd =null;
    }
    catch(e){
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
    return Future(() => uidd);
  }
  static Future<String?> signinWithGoogle(BuildContext context) async{
    String? uid;
    try {
      UserCredential? credential = await auth.signInWithAuthProvider(GoogleAuthProvider());
      User? user = credential.user;
      user!=null?uid = user.uid:uid=null;
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
    return Future.value(uid);
  }


}