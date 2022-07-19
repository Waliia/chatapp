

import 'package:flutter/material.dart';

typedef Future  BtnClickClosure({
  required BuildContext context,
  required GlobalKey<FormFieldState> emailKey ,
  required GlobalKey<FormFieldState> passwordKey,
  required GlobalKey<FormFieldState> nameKey,
  required TextEditingController email ,
  required TextEditingController password,
  required TextEditingController name,
});


class CustomButtonLogin  extends StatelessWidget {
 // final BtnClickClosure btnClickClosure ;
  final Widget child;
  final Color color ;
  final GlobalKey emailKey;
  final GlobalKey passwordKey;
  final GlobalKey? nameKey;
  final TextEditingController emailController ;
  final TextEditingController passwordController ;
  final TextEditingController? nameController  ;
  const CustomButtonLogin({Key? key,
    required this.passwordController,
    required this.emailController,
    this.nameController,
    this.nameKey,
    required this.passwordKey,
    required this.emailKey,
    this.color=Colors.blueAccent,
   // required this.btnClickClosure,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //btnClickClosure(context,emailKey,passwordKey,,);
      },
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(color: Colors.black12,offset: Offset(-3, -3),blurRadius: 5),
              BoxShadow(color: Colors.white54,offset: Offset(3, 3),blurRadius: 5)]
        ),
        child: Center(child: child,),
      ),
    );
  }
}
