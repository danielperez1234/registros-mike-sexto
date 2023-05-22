import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';
import 'package:productos/sevices/firebaseNetwork.dart';
import 'package:productos/sevices/firebase_usuario.dart';
import 'package:productos/widgets/cust_TextField.dart';
import 'package:productos/widgets/cust_scaffold.dart';

import '../widgets/cust_button.dart';

class UserAddPage extends StatelessWidget {
  UserAddPage(
      {Key? key,
      this.nombreS = "",
      this.apellidoS = "",
      this.edadS = "",
      this.generoS = "",
      this.correoS = "",
      this.id})
      : super(key: key);
  String nombreS;
  String apellidoS;
  String edadS;
  String generoS;
  String correoS;

  String? id;

  final _formKey = GlobalKey<FormState>();
  late TextEditingController nombre;
  late TextEditingController apellido;
  late TextEditingController edad;
  late TextEditingController genero;
  late TextEditingController correo;
  late TextEditingController contrasena;
  void initVar() {
    nombre = TextEditingController(text: nombreS);
    apellido = TextEditingController(text: apellidoS);
    edad = TextEditingController(text: edadS);
    genero = TextEditingController(text: generoS);
    correo = TextEditingController(text: correoS);
    contrasena = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    initVar();
    return CustScaffold(
        body: Form(
      key: _formKey,
      child: Center(
        child: Column(
          children: [
            Text(
              "Registro",
              style: Titulos(size: 35),
            ),
            CustTextField(textEditingController: nombre, hint: "Nombre"),
            CustTextField(textEditingController: apellido, hint: "Apellido"),
            CustTextField(
                textEditingController: edad,
                hint: "Edad",
                textInputType:
                    const TextInputType.numberWithOptions(decimal: false)),
            CustTextField(textEditingController: genero, hint: "Genero"),
            CustTextField(
              textEditingController: correo,
              hint: "Correo",
              textInputType: TextInputType.emailAddress,
            ),
            CustTextField(
              textEditingController: contrasena,
              hint: "Clave",
            ),
            CustButton(
                text: "REGISTRAR",
                onPress: () async {
                  if (id != null) {
                    if (_formKey.currentState!.validate()) {
                      await FirebaseUsuarios().updateUsuario(
                          id!,
                          correo.text,
                          contrasena.text,
                          genero.text,
                          nombre.text,
                          edad.text,
                          apellido.text);
                    } else {
                      await FirebaseUsuarios().updateUsuario(
                          id!,
                          correo.text,
                          null,
                          genero.text,
                          nombre.text,
                          edad.text,
                          apellido.text);
                    }
                    Navigator.pop(context);
                    return;
                  }

                  if (_formKey.currentState!.validate()) {
                    await MyFireStore().register(
                        context,
                        correo.text,
                        contrasena.text,
                        genero.text,
                        nombre.text,
                        edad.text,
                        apellido.text);
                    Navigator.pop(context);
                  } else {}
                })
          ],
        ),
      ),
    ));
  }
}
