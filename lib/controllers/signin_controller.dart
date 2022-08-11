import 'package:chat_app1/bloc/signinpagecbloc/signin_bloc.dart';
import 'package:chat_app1/pages/signuppage/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String? isValidEmail(String? email) {
  /*
     This fucntion validate email
   */
  if (email!.isEmpty) {
    return 'must enter email';
  } else if (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email)) {
    return null;
  } else {
    return 'email is not valid';
  }
}

String? isValidPassword(String? password) {
  /*
     This fucntion validate password
   */
  if (password!.isEmpty) {
    return 'must enter passowrd';
  } else if (password.length < 7) {
    return 'length should>=7';
  } else {
    return null;
  }
}

String? isValidName(String? name) {
  if (name!.isEmpty) {
    return 'must enter name';
  } else {
    return null;
  }
}

void btnSignin(
    {context,
    emailController,
    emailValidationKey,
    passwordController,
    passwordValidationKey}) {
  SigninBloc signinBloc = Provider.of<SigninBloc>(context, listen: false);
  if ((emailValidationKey as GlobalKey<FormFieldState>)
          .currentState!
          .validate() &&
      (passwordValidationKey as GlobalKey<FormFieldState>)
          .currentState!
          .validate()) {
    signinBloc.add(SigninClickEvent(
        emailController.text.trim(), passwordController.text.trim()));
  }
}

void registerNowClick(BuildContext context) {
  Navigator.pushNamed(context, SignupPage.PAGE_NAME);
}

void googleSigninClick(BuildContext context) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('Google signin')));
}

void forgotPasswordClick(BuildContext context) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('Forgot password')));
}
