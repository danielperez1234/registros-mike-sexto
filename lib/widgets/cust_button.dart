import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustButton extends StatelessWidget {
  CustButton({super.key, required this.text,required this.onPress});
  String text;
  Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text(text),
        onPressed: () {
          onPress(),
        },
      ),
    );
  }

  //hola amigos los quiero
}
