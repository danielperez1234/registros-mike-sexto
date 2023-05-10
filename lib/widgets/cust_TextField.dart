import 'package:flutter/material.dart';
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
          margin: const EdgeInsets.only(top: 10),
          height: 20,
          child: Text(
            widget.textEditingController.text != "" ? widget.hint : "",
            style: Medianos(color: kGray, size: 18, letterSpacing: 5),
          ),
        ),
        FormField<String>(
          validator: (value) {
            print(value);
            if (value == null || value.isEmpty) {
              return "Por favor no lo dejes en blanco";
            }
            return null;
          },
          builder: (FormFieldState<dynamic> field) {
            return Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: 60,
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: kWhite.withOpacity(.1),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: kGray, width: 3)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: widget.textEditingController,
                              keyboardType: widget.textInputType,
                              obscureText: isObscure,
                              textAlign: TextAlign.center,
                              style: Medianos(
                                  color: kWhite, size: 18, letterSpacing: 5),
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
                                field.setValue(s);
                                setState(() {});
                              },
                            ),
                          ),
                          if (widget.isObscure)
                            GestureDetector(
                              child: const Icon(
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
                if (field.hasError)
                  Text(
                    field.errorText ?? "",
                    style: Chicos(color: Colors.white),
                  )
              ],
            );
          },
        ),
      ],
    );
  }
}
