import 'package:flutter/material.dart';

typedef ValidatorClosure = String? Function(String? value);
typedef void OnChange(String? value, GlobalKey<FormFieldState> globalkey);

class SinginInputField extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormFieldState> validationKey;
  final String hint;
  final double width;
  final double height;
  final TextInputType textInputType;
  final ValidatorClosure validatorClosure;

  const SinginInputField(
      {Key? key,
      required this.textInputType,
      required this.validatorClosure,
      required this.hint,
      required this.height,
      required this.width,
      required this.controller,
      required this.validationKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        key: validationKey,
        controller: controller,
        validator: validatorClosure,
        onChanged: (value) {
          validationKey.currentState!.isValid;
        },
        keyboardType: textInputType,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          label: Text('$hint'),
          labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue, width: 1),
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
    );
  }
}
