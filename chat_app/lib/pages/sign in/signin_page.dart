import 'package:chat_app/controller/sign_in_controller.dart';
import 'package:flutter/material.dart';

import '../../controller/sign_up_controller.dart';
import '../sign up/signup_widgets/HaveAccountText.dart';
import '../sign up/signup_widgets/custom_button_login.dart';
import '../sign up/signup_widgets/input_field.dart';

class SigninView extends StatelessWidget {
  static const String PAGE_NAME = 'signinPage';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey emailGlobalKey = GlobalKey<FormFieldState>();
  final GlobalKey nameGlobalKey = GlobalKey<FormFieldState>();
  final GlobalKey passwordGlobalKey = GlobalKey<FormFieldState>();
  SigninView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height - 85;
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: height * .44,
                ),
                //Input Field Email
                SizedBox(
                  height: height * .13,
                  child: InputField(
                      textInputType: TextInputType.emailAddress,
                      globalKey: emailGlobalKey,
                      controller: emailController,
                      label: 'enter email',
                      onChangeClosure: SignupController.onEmailChange,
                      closure: SignupController.emailValidater),
                ),
                SizedBox(
                  height: height * .01,
                ),
                //Input field Password
                SizedBox(
                  height: height * .13,
                  child: InputField(
                      textInputType: TextInputType.visiblePassword,
                      globalKey: passwordGlobalKey,
                      controller: passwordController,
                      label: 'enter password',
                      onChangeClosure: SignupController.onPasswordChange,
                      closure: SignupController.passwordValidater),
                ),
                //forgot password
                Container(
                  alignment: Alignment(1, -1),
                  height: height * .03,
                  child: const Text(
                    'forgot password',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                        fontSize: 16,
                        decorationColor: Colors.blue),
                  ),
                ),
                SizedBox(
                  height: height * .05,
                ),
                //Sign up Buitton
                SizedBox(
                    height: height * .08,
                    child: CustomButtonLogin(
                        passwordKey: passwordGlobalKey,
                        emailController: emailController,
                        emailKey: emailGlobalKey,
                        passwordController: passwordController,
                        nameController: nameController,
                        nameKey: nameGlobalKey,
                        child: Text(
                          'Sign in',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ))),
                SizedBox(
                  height: height * .03,
                ),
                //Google Sign in Buitton
                SizedBox(
                  height: height * .08,
                  child: CustomButtonLogin(
                      passwordController: passwordController,
                      emailKey: emailGlobalKey,
                      passwordKey: passwordGlobalKey,
                      emailController: emailController,
                      color: Colors.white,
                      child: Text(
                        'Sign in with google',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )),
                ),
                SizedBox(
                  height: height * .01,
                ),
                SizedBox(
                    height: height * .04,
                    child: HaveAccountText(
                      emailKey: emailGlobalKey,
                      passwordKey: passwordGlobalKey,
                      click: SigninController.registerNowClick,
                      text: 'Register now',
                      firstText: 'Dont\'t have account?',
                    )),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
