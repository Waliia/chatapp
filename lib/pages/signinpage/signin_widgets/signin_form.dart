import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../controllers/signin_controller.dart';
import '../../../widgets/already_have_account.dart';
import '../../../widgets/google_signin_btn.dart';
import '../../../widgets/simple_btn.dart';
import 'forgot_password_widget.dart';
import 'input_field.dart';

class SigninForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final GlobalKey<FormFieldState> emailGlobalKey;
  final GlobalKey<FormFieldState> passwordGlobalKey;

  SigninForm(
      {Key? key,
      required this.passwordController,
      required this.emailController,
      required this.emailGlobalKey,
      required this.passwordGlobalKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height - 85;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: height * .44,
              ),
              //Input Field Email
              SinginInputField(
                textInputType: TextInputType.emailAddress,
                validatorClosure: isValidEmail,
                hint: 'user email',
                height: height * .13,
                width: width,
                controller: emailController,
                validationKey: emailGlobalKey,
              ),
              SizedBox(
                height: height * .01,
              ),
              //Input field Password
              SinginInputField(
                textInputType: TextInputType.visiblePassword,
                validatorClosure: isValidPassword,
                hint: 'user password',
                controller: passwordController,
                validationKey: passwordGlobalKey,
                height: height * .13,
                width: width,
              ),
              //forgot password
              ForgotPassword(
                click: forgotPasswordClick,
                width: width,
                height: height * .03,
              ),
              SizedBox(
                height: height * .05,
              ),
              //Sign up Buitton
              SigninButton(
                text: 'Sign in',
                emailController: emailController,
                passwordController: passwordController,
                width: width,
                height: height * .08,
                signinBtnClick: btnSignin,
                emailValidationKey: emailGlobalKey,
                passwordValidationKey: passwordGlobalKey,
              ),
              SizedBox(
                height: height * .03,
              ),
              //Google Sign in Buitton
              GoogleBtn(
                text: 'Google Signin',
                btnClick: googleSigninClick,
                width: width,
                height: height * .08,
              ),
              SizedBox(
                height: height * .02,
              ),
              HaveAccount(
                textClick: registerNowClick,
                firstMsg: 'Don\'t have an account?',
                secondMsg: 'Register Now',
                height: height * .03,
                width: width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
