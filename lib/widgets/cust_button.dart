import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustButton extends StatelessWidget {
  CustButton({super.key, required this.text, required this.onPress, this.icon});
  String text;
  Function() onPress;
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
              colors: [
                Colors.blue.withOpacity(.5),
                Color.fromARGB(255, 163, 52, 52)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 1]),
          boxShadow: [
            BoxShadow(
                color: Colors.pink,
                blurRadius: 20,
                spreadRadius: 3,
                offset: Offset(3, 3)),
            BoxShadow(
                color: Colors.blue,
                blurRadius: 20,
                spreadRadius: 3,
                offset: Offset(-3, -3))
          ],
          borderRadius: BorderRadius.circular(25)),
      child: RawMaterialButton(
        elevation: 8,
        highlightElevation: 2,
        hoverColor: Colors.grey.withOpacity(.5),
        splashColor: Colors.black,
        child: Container(
            alignment: Alignment.center,
            height: 50,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  icon,
                  color: Colors.blue,
                  size: 35,
                ),
                Text(text),
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
