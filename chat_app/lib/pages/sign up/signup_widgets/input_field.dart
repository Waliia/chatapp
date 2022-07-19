
import 'package:flutter/material.dart';

typedef ValidatorClosure = String? Function(String? value);
typedef void OnChange(String? value , GlobalKey<FormFieldState> globalkey);
class InputField extends StatelessWidget {
  final String label ;
  final TextEditingController controller ;
   final TextInputType textInputType;
  final  globalKey ;
  final ValidatorClosure closure;
  final OnChange onChangeClosure;
  const InputField({Key? key,required this.textInputType,required this.globalKey,required this.controller,required this.label,required this.onChangeClosure,required this.closure , }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key:globalKey,
      onChanged: (value) {
        onChangeClosure.call(value,globalKey);
      },
      validator:closure,
      controller: controller,
      keyboardType:textInputType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: const  TextStyle(color: Colors.white),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red,width: 1,),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blue,width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red,width: 1,),
        ),
      ),
    );
  }
}
