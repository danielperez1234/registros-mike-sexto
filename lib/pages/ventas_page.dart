import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';
import 'package:productos/widgets/cust_TextField.dart';
import 'package:productos/widgets/cust_button.dart';
import 'package:productos/widgets/cust_scaffold.dart';

class VentasPage extends StatelessWidget {
  VentasPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
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
        body: Form(
          key: _formKey,
          child: Center(
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
              textInputType:  TextInputType.numberWithOptions(decimal: false),
            ),
            CustTextField(textEditingController: idVendedor, hint: "ID vendedor",textInputType:  TextInputType.numberWithOptions(decimal: false),),
            CustTextField(textEditingController: idCliente, hint: "ID cliente",textInputType:  TextInputType.numberWithOptions(decimal: false),),
            CustTextField(textEditingController: piezas, hint: "Piezas",textInputType: TextInputType.numberWithOptions(decimal: false),),
            CustTextField(textEditingController: subtotal, hint: "Sub total",textInputType: TextInputType.number,),
            CustTextField(textEditingController: total, hint: "Total",textInputType: TextInputType.number,),
            CustButton(
                text: "REGISTRAR",
                onPress: () {
                if (_formKey.currentState!.validate()){
                  Navigator.pop(context);
                }else{
                  
                }
                  
                })
          ],
              ),
            ),
        ));
  }
}
