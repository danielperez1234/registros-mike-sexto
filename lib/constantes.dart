import 'package:flutter/material.dart';

const kWhite = Color.fromARGB(255, 247, 249, 255);
const kRed = Color(0xffff1f33);
const kGray = Color(0xff050000);
const kBlack = Color(0xff001f33);
const kBackGround = Color(0xFFF6A8A2);
//Para los titulos:
TextStyle Titulos({double size = 20, Color color = kRed}) => TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: color,
      letterSpacing: 5,
      fontFamily: 'Roman',
    );

//Para los textos medianos:
TextStyle Medianos(
        {double size = 16,
        Color color = kBlack,
        double? letterSpacing,
        TextDecoration? decoration}) =>
    TextStyle(
        fontSize: size,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w400,
        color: color,
        fontFamily: 'Roman',
        decoration: decoration);

//Para los textos chicos:
TextStyle Chicos({Color color = kBlack}) => TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: 'Roman',
    );
