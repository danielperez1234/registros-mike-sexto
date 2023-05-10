import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';
import 'package:productos/widgets/cust_TextField.dart';
import 'package:productos/widgets/cust_scaffold.dart';

import '../widgets/cust_button.dart';

class ProductosAddPage extends StatelessWidget {
  ProductosAddPage({Key? key}) : super(key: key);
  var nombre = TextEditingController();
  var descripcion = TextEditingController();
  var algo = TextEditingController();
  var algo2 = TextEditingController();
  var precio = TextEditingController();
  var utilidad = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustScaffold(
        body: Form(
          key: _formKey,
          child: Center(
              child: Column(
          children: [
            Text(
              "Productos",
              style: Titulos(color: kWhite, size: 35),
            ),
            CustTextField(textEditingController: nombre, hint: "Nombre"),
            CustTextField(
                textEditingController: descripcion, hint: "Descripcion"),
            CustTextField(textEditingController: algo, hint: "Algo"),
            CustTextField(textEditingController: algo2, hint: "Algo2"),
            CustTextField(textEditingController: precio, hint: "Precio",textInputType: TextInputType.number,),
            CustTextField(textEditingController: utilidad, hint: "Utilidad",textInputType: TextInputType.number,),
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
