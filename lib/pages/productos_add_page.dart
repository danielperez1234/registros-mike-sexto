import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';
import 'package:productos/widgets/cust_TextField.dart';
import 'package:productos/widgets/cust_scaffold.dart';

class UserAddPage extends StatelessWidget {
  UserAddPage({Key? key}) : super(key: key);
  var nombre = TextEditingController();
  var descripcion = TextEditingController();
  var algo = TextEditingController();
  var algo2 = TextEditingController();
  var precio = TextEditingController();
  var utilidad = TextEditingController();
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
          CustTextField(
              textEditingController: descripcion, hint: "Descripcion"),
          CustTextField(textEditingController: algo, hint: "Algo"),
          CustTextField(textEditingController: algo2, hint: "Algo2"),
          CustTextField(textEditingController: precio, hint: "Precio"),
          CustTextField(textEditingController: utilidad, hint: "Utilidad")
        ],
      ),
    ));
  }
}
