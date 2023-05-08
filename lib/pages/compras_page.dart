import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';
import 'package:productos/widgets/cust_TextField.dart';
import 'package:productos/widgets/cust_scaffold.dart';

import '../widgets/cust_button.dart';

class ComprasPage extends StatelessWidget {
  ComprasPage({Key? key}) : super(key: key);
  var idProduct = TextEditingController();
  var nombre = TextEditingController();
  var piezas = TextEditingController();
  var idAdmin = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustScaffold(
        body: Center(
      child: Column(
        children: [
          Text(
            "compras",
            style: Titulos(color: kWhite, size: 35),
          ),
          CustTextField(
            textEditingController: idProduct,
            hint: "Id producto",
            textInputType:
                const TextInputType.numberWithOptions(decimal: false),
          ),
          CustTextField(textEditingController: nombre, hint: "name"),
          CustTextField(textEditingController: piezas, hint: "Piezas",textInputType:  TextInputType.numberWithOptions(decimal: false),),
          CustTextField(
              textEditingController: idAdmin, hint: "ID administrador",textInputType:  TextInputType.numberWithOptions(decimal: false),),
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
