import 'package:chat_app1/controllers/signin_controller.dart';
import 'package:chat_app1/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../bloc/signup_bloc.dart';
import '../../widgets/already_have_account.dart';
import '../../widgets/google_signin_btn.dart';
import '../chatpage/chat_page.dart';

class SignupPage extends StatelessWidget {
  static const String PAGE_NAME = 'signupPage';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormFieldState> emailGlobalKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> passwordGlobalKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> nameGlobalKey = GlobalKey<FormFieldState>();

  SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<SignupBloc>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height - 85;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
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
                      width: width,
                      child: TextFormField(
                        key: nameGlobalKey,
                        validator: isValidName,
                        controller: nameController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          label: Text('enter name'),
                          labelStyle: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    //Input Field Email
                    SizedBox(
                      height: height * .13,
                      width: width,
                      child: TextFormField(
                        key: emailGlobalKey,
                        validator: isValidEmail,
                        controller: emailController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          label: Text('enter email'),
                          labelStyle: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    //Input field Password
                    SizedBox(
                      height: height * .13,
                      width: width,
                      child: TextFormField(
                        key: passwordGlobalKey,
                        validator: isValidPassword,
                        controller: passwordController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          label: Text('enter email'),
                          labelStyle: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .05,
                    ),
                    //Sign up Buitton
                    GestureDetector(
                        onTap: () {
                          if (emailGlobalKey.currentState!.validate()) {
                            String email = emailController.text;
                            String password = passwordController.text;
                            String name = nameController.text;
                            bloc.add(SignUpBtnEvent(name, password, email));
                          }
                        },
                        child: btnSignupClick(height * .08, width)),
                    SizedBox(
                      height: height * .03,
                    ),
                    //Google Sign up Buitton
                    GoogleBtn(
                      text: 'Google signup',
                      btnClick: googleSignupClick,
                      width: width,
                      height: height * .08,
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    HaveAccount(
                      firstMsg: 'Already have acount',
                      secondMsg: 'Sign in',
                      textClick: signinClick,
                      width: width,
                      height: height * .03,
                    )
                  ],
                ),
              ),
            ),
          )),
          BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
            if (state is SignupInitial) {
              return SizedBox();
            } else if (state is SignupLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SignupLoadedState) {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.pushReplacementNamed(context, ChatPage.PAGE_NAME);
              });
              return SizedBox();
            } else if (state is SignupErrorState) {
              return SizedBox();
            } else {
              return SizedBox();
            }
          })
        ],
      ),
    );
  }

  Widget btnSignupClick(double height, double width) {
    return SizedBox(
      height: height,
      width: width,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, offset: Offset(-3, -3), blurRadius: 5),
              BoxShadow(
                  color: Colors.white54, offset: Offset(3, 3), blurRadius: 5)
            ]),
        child: Center(
          child: Text('Signup',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}
