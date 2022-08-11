import 'package:flutter/material.dart';

typedef void SigninBtnClick({
  required var context,
  required var passwordController,
  required var emailController,
  required var emailValidationKey,
  required var passwordValidationKey,
});

class SigninButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormFieldState> emailValidationKey;
  final GlobalKey<FormFieldState> passwordValidationKey;
  final SigninBtnClick signinBtnClick;

  const SigninButton(
      {required this.signinBtnClick,
      required this.emailController,
      required this.passwordController,
      required this.emailValidationKey,
      required this.passwordValidationKey,
      required this.text,
      required this.width,
      required this.height,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: GestureDetector(
        onTap: () {
          signinBtnClick(
              context: context,
              emailController: emailController,
              passwordController: passwordController,
              passwordValidationKey: passwordValidationKey,
              emailValidationKey: emailValidationKey);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(-3, -3),
                    blurRadius: 5),
                BoxShadow(
                    color: Colors.white54, offset: Offset(3, 3), blurRadius: 5)
              ]),
          child: Center(
            child: Text('$text',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
          ),
        ),
      ),
    );
  }
}
