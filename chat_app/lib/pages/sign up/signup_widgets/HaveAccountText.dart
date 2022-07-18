
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

typedef void RegisteNowClick(BuildContext context);

class HaveAccountText extends  StatelessWidget {
  final RegisteNowClick click;
  final String text ;
  final String firstText ;
  final emailKey;
  final passwordKey ;

  const HaveAccountText({
    Key? key,
    this.firstText='Already have an account?',
    this.text = 'Signin now',
    required this.emailKey,
    required this.passwordKey,
    required this.click,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(child: Text.rich(
        TextSpan(text:'$firstText ',
            style: TextStyle(color: Colors.blue),
            children: [
              TextSpan(
                  text: text ,
                  style: const TextStyle(
                      color: Colors.blueAccent,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      decorationThickness: 2),
                  recognizer:TapGestureRecognizer()
                    ..onTap=(){
                    click(context , );
                  }
              ),
            ])
    ));
  }
}
