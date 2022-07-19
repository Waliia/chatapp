
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupController{

  static FirebaseAuth firebaseAuth  = FirebaseAuth.instance;
  static void onEmailChange(String? value , GlobalKey<FormFieldState> key){
    key.currentState!.validate();
  }
  static void onPasswordChange(String? value , GlobalKey<FormFieldState> key){
    key.currentState!.validate();
  }
  static void onNameChnage(String? value , GlobalKey<FormFieldState> key){
    key.currentState!.validate();
  }


  static String? emailValidater(String ? value){
    if(value!.isEmpty){
      return 'email is required';
    }
    else if(!value.contains('@') || !value.endsWith('.com')){
      return 'invalid email';
    }
    else{
      return null;
    }
  }
  static String? passwordValidater(String ? value){
    if(value!.isEmpty){
      return 'password is required';
    }
    else if(value.length<7){
      return 'length should be >= 7';
    }
    else{
      return null;
    }
  }
  static String? nameValidater(String ? value){
    if(value!.isEmpty){
      return 'name is required';
    }
    else if(value.length<3){
      return 'length should be >= 3';
    }
    else{
      return null;
    }
  }

  static void signInNowClick(BuildContext context ){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signin now click')));
  }

  static void signUpBtnClick(BuildContext context,var emailKey , var passwordKey){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('SignUp btn click')));
  }

  static void signUpWithGoogleClick(BuildContext context,var emailKey , var passwordKey){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup google click')));
  }

  static Future<String?> registerWithEmailAndPassword(String email , String password,BuildContext context) async{
    String? uid;
    try {
      UserCredential? credential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = credential.user;
      user != null ? uid = user.uid : uid = null;
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
    return Future(() => uid);
    }
  static Future<String?> registerWithGoogle(BuildContext context)async{
     String? uid;
    try{
      UserCredential? credential  = await firebaseAuth.signInWithAuthProvider(GoogleAuthProvider());
      User? user = credential.user;
      user!=null?uid=user.uid:uid=null;
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup google click')));
    }
    return Future.value(uid);
  }

  static Future<void> resetPassword(String email,BuildContext context) async{
    try {
      return await firebaseAuth.sendPasswordResetEmail(email: email);
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}