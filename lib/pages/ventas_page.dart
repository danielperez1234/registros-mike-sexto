import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';
import 'package:productos/widgets/cust_TextField.dart';
import 'package:productos/widgets/cust_button.dart';
import 'package:productos/widgets/cust_scaffold.dart';

class VentasPage extends StatelessWidget {
  VentasPage({Key? key}) : super(key: key);
  var idProduct = TextEditingController();
  var nombre = TextEditingController();
  var cantidad = TextEditingController();
  var idVendedor = TextEditingController();
  var idCliente = TextEditingController();
  var piezas = TextEditingController();

  var subtotal = TextEditingController();

  var total = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustScaffold(
        body: Center(
      child: Column(
        children: [
          Text(
            "ventas",
            style: Titulos(color: kWhite, size: 35),
          ),
          CustTextField(
            textEditingController: idProduct,
            hint: "Id producto",
            textInputType:
                const TextInputType.numberWithOptions(decimal: false),
          ),
          CustTextField(textEditingController: nombre, hint: "name"),
          CustTextField(
            textEditingController: cantidad,
            hint: "Cantidad",
            textInputType: TextInputType.number,
          ),
          CustTextField(textEditingController: idVendedor, hint: "ID vendedor"),
          CustTextField(textEditingController: idCliente, hint: "ID cliente"),
          CustTextField(textEditingController: piezas, hint: "Piezas"),
          CustTextField(textEditingController: subtotal, hint: "Sub total"),
          CustTextField(textEditingController: total, hint: "Total"),
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
