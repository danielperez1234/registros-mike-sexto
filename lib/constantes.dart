import 'dart:math';
import 'package:flutter/material.dart';

Color NoRights = Color.fromARGB(0, 0, 0, 0);
Color Rights = Color.fromARGB(255, 255, 255, 255);
Color Green = Color.fromARGB(255, 1, 103, 1);
Color Gris = Color.fromARGB(255, 80, 76, 79);
Color Blue = Color.fromARGB(255, 0, 2, 116);

//Para los titulos:
TextStyle Titulos() => TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: NoRights,
      fontFamily: 'Montserrat',
    );

//Para los textos medianos:
TextStyle Medianos() => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: NoRights,
      fontFamily: 'Montserrat',
    );

//Para los textos chicos:
TextStyle Chicos() => TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w100,
      color: NoRights,
      fontFamily: 'Montserrat',
    );
