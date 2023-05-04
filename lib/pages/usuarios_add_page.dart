import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';
import 'package:productos/widgets/cust_TextField.dart';
import 'package:productos/widgets/cust_scaffold.dart';

import '../widgets/cust_button.dart';

class UserAddPage extends StatelessWidget {
  UserAddPage({Key? key}) : super(key: key);
  var nombre = TextEditingController();
  var apellido = TextEditingController();
  var edad = TextEditingController();
  var genero = TextEditingController();
  var correo = TextEditingController();
  var contrasena = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustScaffold(
        body: Center(
      child: Column(
        children: [
          Text(
            "Registro",
            style: Titulos(color: kWhite, size: 35),
          ),
          CustTextField(textEditingController: nombre, hint: "Nombre"),
          CustTextField(textEditingController: apellido, hint: "Apellido"),
          CustTextField(
              textEditingController: edad,
              hint: "Edad",
              textInputType: TextInputType.numberWithOptions(decimal: false)),
          CustTextField(textEditingController: genero, hint: "Genero"),
          CustTextField(textEditingController: correo, hint: "Correo"),
          CustTextField(textEditingController: contrasena, hint: "Contraseña"),
          CustButton(
              text: "REGISTRAR",
              onPress: () {
                Navigator.pop(context);
              })
        ],
      ),
    ));
  }
}
