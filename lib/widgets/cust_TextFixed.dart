import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';
import 'package:productos/dialogs/app_select_id_dialog.dart';

class CustTextFixed extends StatelessWidget {
  CustTextFixed({Key? key, required this.text, required this.hint})
      : super(key: key);
  String text;
  String hint;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: 20,
          child: Text(
            hint,
            style: Medianos(color: kGray, size: 18, letterSpacing: 5),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width * .8,
            height: 60,
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                color: kWhite.withOpacity(.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: kGray, width: 3)),
            child: Center(
              child: Text(
                text,
                style: Medianos(color: kWhite, size: 18),
              ),
            )),
      ],
    );
  }
}
