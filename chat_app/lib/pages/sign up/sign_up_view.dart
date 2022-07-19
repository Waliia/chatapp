import 'package:chat_app/pages/sign%20in/sign_in_controller.dart';
import 'package:chat_app/pages/sign%20up/sign_up_controller.dart';
import 'package:chat_app/pages/sign%20up/signup_widgets/HaveAccountText.dart';
import 'package:chat_app/pages/sign%20up/signup_widgets/custom_button_login.dart';
import 'package:chat_app/pages/sign%20up/signup_widgets/input_field.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  static const String PAGE_NAME = 'signupPage';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey emailGlobalKey = GlobalKey<FormFieldState>();
  final GlobalKey passwordGlobalKey = GlobalKey<FormFieldState>();
  final GlobalKey nameGlobalKey = GlobalKey<FormFieldState>();
  Signup({Key? key}) : super(key: key);

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
                  height: height * .31,
                ),
                //Input field user name
                SizedBox(
                  height: height * .13,
                  child: InputField(
                    globalKey: nameGlobalKey,
                    controller: nameController,
                    label: 'enter name',
                    onChangeClosure: SignupController.onNameChnage,
                    closure: SignupController.nameValidater,
                    textInputType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: height * .01,
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
                SizedBox(
                  height: height * .05,
                ),
                //Sign up Buitton
                SizedBox(
                    height: height * .08,
                    child: CustomButtonLogin(
                        emailKey: emailGlobalKey,
                        passwordKey: passwordGlobalKey,
                        emailController: emailController,
                        passwordController: passwordController,
                        nameKey: nameGlobalKey,
                        //btnClickClosure: SignupController.signUpBtnClick,
                        child: const Text(
                          'Sign up',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ))),
                SizedBox(
                  height: height * .03,
                ),
                //Google Sign up Buitton
                SizedBox(
                  height: height * .08,
                  child: CustomButtonLogin(
                      emailKey: emailGlobalKey,
                      passwordKey: passwordGlobalKey,
                      emailController: emailController,
                      passwordController: passwordController,
                      //btnClickClosure: SignupController.signUpWithGoogleClick,
                      color: Colors.white,
                      child: const Text(
                        'Sign up with google',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )),
                ),
                SizedBox(
                  height: height * .02,
                ),
                SizedBox(
                    height: height * .03,
                    child: HaveAccountText(
                        emailKey: emailGlobalKey,
                        passwordKey: passwordGlobalKey,
                        click:
                            SigninController.registerNowClick) //'Signin now',)
                    ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
