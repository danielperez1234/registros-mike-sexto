import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustTextField extends StatefulWidget {
  CustTextField(
      {super.key,
      required this.textEditingController,
      this.isObscure = false,
      this.textInputType = TextInputType.text});
  TextEditingController textEditingController;
  bool isObscure;
  TextInputType textInputType;

  @override
  State<CustTextField> createState() => _CustTextFieldState();
}

class _CustTextFieldState extends State<CustTextField> {
  late bool isObscure;
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    print("hice un ss alv");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isObscure = widget.isObscure;
    print("estoy armando la pantalla por primera vez");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey, width: 2)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.textEditingController,
              keyboardType: widget.textInputType,
              obscureText: isObscure,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20, right: 20),
                  //labelText: 'Ingresa tu informacion',
                  hintText: 'Please enter a search term',
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none),
            ),
          ),
          if (widget.isObscure)
            GestureDetector(
              child: Icon(Icons.visibility),
              onTapDown: (a) {
                isObscure = false;
                setState(() {});
              },
              onTapUp: (a) {
                isObscure = true;
                setState(() {});
              },
            )
        ],
      ),
    );
  }
}
