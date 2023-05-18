import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';

class CustButton extends StatelessWidget {
  CustButton({super.key, required this.text, required this.onPress});
  String text;
  Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        /*boxShadow: [
            BoxShadow(
                color: kRed.withOpacity(1),
                blurRadius: 10,
                offset: const Offset(0, 8))
          ]*/
      ),
      child: RawMaterialButton(
        highlightElevation: 0,
        elevation: 0,
        focusElevation: 0,
        fillColor: kWhite,
        hoverColor: kBlack.withOpacity(.05),
        splashColor: kRed.withOpacity(.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        onPressed: () {
          onPress();
        },
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
      ),
    );
  }

  //hola amigos los quiero
}
