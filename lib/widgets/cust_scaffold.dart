import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';

class CustScaffold extends StatelessWidget {
  CustScaffold({Key? key, required this.body}) : super(key: key);
  Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(
              colors: [kBackGround, kBackGround],
              center: Alignment.bottomRight,
              radius: 2)),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
            child: SingleChildScrollView(
          child: body,
        )),
      ),
    );
  }
}
