import 'package:chat_app1/pages/signinpage/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/signup_bloc.dart';

/*
   this is function is signin button
 */

void btnSignupClick(
    {required BuildContext context,
    required TextEditingController emailController,
    required GlobalKey<FormFieldState> emailValidationKey,
    required TextEditingController nameController,
    required GlobalKey<FormFieldState> nameValidationKey,
    required TextEditingController passwordController,
    required GlobalKey<FormFieldState> passwordValidationKey}) {
  if (emailValidationKey.currentState!.validate() &&
      passwordValidationKey.currentState!.validate() &&
      nameValidationKey.currentState!.validate()) {
    SignupBloc bloc = Provider.of(context, listen: false);
    bloc.add(SignUpBtnEvent(
        nameController.text, passwordController.text, emailController.text));
  }
}

void signinClick(BuildContext context) {
  Navigator.pushNamed(context, SigninPage.PAGE_NAME);
}

void googleSignupClick(BuildContext context) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('Google signup')));
}
