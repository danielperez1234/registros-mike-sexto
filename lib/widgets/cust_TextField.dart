import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:productos/constantes.dart';

class CustTextField extends StatefulWidget {
  CustTextField(
      {super.key,
      required this.textEditingController,
      required this.hint,
      this.isObscure = false,
      this.textInputType = TextInputType.text});
  TextEditingController textEditingController;
  bool isObscure;
  String hint;
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
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 20,
          child: Text(
            widget.textEditingController.text != "" ? widget.hint : "",
            style: Medianos(color: kGray, size: 18, letterSpacing: 5),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * .8,
          height: 60,
          margin: EdgeInsets.only(bottom: 15),
          padding: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
              color: kWhite.withOpacity(.1),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: kGray, width: 3)),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: widget.textEditingController,
                      keyboardType: widget.textInputType,
                      obscureText: isObscure,
                      textAlign: TextAlign.center,
                      style:
                          Medianos(color: kWhite, size: 18, letterSpacing: 5),
                      decoration: InputDecoration(
                          hintStyle: Medianos(
                              color: kGray, size: 18, letterSpacing: 5),
                          //labelText: 'Ingresa tu informacion',
                          hintText: widget.hint,
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none),
                      onChanged: (s) {
                        setState(() {});
                      },
                    ),
                  ),
                  if (widget.isObscure)
                    GestureDetector(
                      child: Icon(
                        Icons.visibility,
                        color: kGray,
                      ),
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
            ],
          ),
        ),
      ],
    );
  }
}
