import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustTextField extends StatelessWidget {
  CustTextField(
      {super.key,
      required this.textEditingController,
      this.isObscure = false,
      this.textInputType = TextInputType.text});
  TextEditingController textEditingController;
  bool isObscure;
  TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: textEditingController,
        keyboardType: textInputType,
        obscureText: isObscure,
        decoration: InputDecoration(
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none),
      ),
    );
  }
}
