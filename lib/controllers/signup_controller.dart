import 'package:flutter/material.dart';

void btnSignup(
    {required BuildContext context,
    required TextEditingController emailController,
    required GlobalKey<FormFieldState> emailValidationKey,
    required TextEditingController nameController,
    required GlobalKey<FormFieldState> nameValidationKey,
    required TextEditingController passwordController,
    required GlobalKey<FormFieldState> passwordValidationKey}) {
  // if (emailValidationKey.currentState!.validate() &&
  //     passwordValidationKey.currentState!.validate() &&
  //     nameValidationKey.currentState!.validate()) {
  //   SignupBloc bloc = context.watch<SignupBloc>();
  //   bloc.add(BtnSignupEvent(
  //       name: nameController.text,
  //       password: passwordController.text,
  //       email: emailController.text));
}

void signinClick(BuildContext context) {
  Navigator.pop(context);
}

void googleSignupClick(BuildContext context) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('Google signup')));
}
