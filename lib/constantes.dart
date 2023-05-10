import 'package:flutter/material.dart';

const kWhite = Color.fromARGB(255, 255, 255, 255);
const kRed = Color(0xff940101);
const kGray = Color(0xffb78484);
const kBlack = Color(0xff330000);
const kBackGround = Color(0xFF000000);
//Para los titulos:
TextStyle Titulos({double size = 20, Color color = kRed}) => TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: color,
      letterSpacing: 5,
      fontFamily: 'Montserrat',
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
        fontWeight: FontWeight.w500,
        color: color,
        fontFamily: 'Montserrat',
        decoration: decoration);

//Para los textos chicos:
TextStyle Chicos() => const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w100,
      color: kBlack,
      fontFamily: 'Montserrat',
    );
