import 'package:flutter/material.dart';

typedef void BtnClick(BuildContext context);

class GoogleBtn extends StatelessWidget {
  final double height;
  final double width;
  final BtnClick btnClick;
  final String text;

  const GoogleBtn(
      {required this.text,
      required this.btnClick,
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
          btnClick(context);
        },
        child: Container(
          // height: height,
          // width: width,
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
            child: Text(
              '$text',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
