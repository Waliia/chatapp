import 'package:flutter/material.dart';

typedef void PassForgotClick(BuildContext context);

class ForgotPassword extends StatelessWidget {
  final double height;
  final double width;
  final PassForgotClick click;
  const ForgotPassword(
      {required this.click,
      required this.width,
      required this.height,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(1, -1),
      height: height,
      width: width,
      child: GestureDetector(
        onTap: () {
          click(context);
        },
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
    );
  }
}
