import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:productos/constantes.dart';

class CustButton extends StatelessWidget {
  CustButton({super.key, required this.text, required this.onPress});
  String text;
  Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: kRed.withOpacity(1),
                blurRadius: 10,
                offset: Offset(0, 8))
          ]),
      child: RawMaterialButton(
        highlightElevation: 2,
        fillColor: kWhite,
        hoverColor: kBlack.withOpacity(.05),
        splashColor: kRed.withOpacity(.3),
        child: Container(
            alignment: Alignment.center,
            height: 50,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  text.toUpperCase(),
                  style: Titulos(size: 20),
                ),
              ],
            )),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        onPressed: () {
          onPress();
        },
      ),
    );
  }

  //hola amigos los quiero
}
