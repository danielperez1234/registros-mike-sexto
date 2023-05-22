import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';
import 'package:productos/sevices/firebase_producto.dart';
import 'package:productos/widgets/cust_TextField.dart';
import 'package:productos/widgets/cust_scaffold.dart';

import '../widgets/cust_button.dart';

class ProductosAddPage extends StatelessWidget {
  ProductosAddPage(
      {Key? key,
      this.nombreS = "",
      this.descripcionS = "",
      this.algoS = "",
      this.algo2S = "",
      this.precioS = "",
      this.utilidadS = "",
      this.id})
      : super(key: key);
  String nombreS;
  String descripcionS;
  String algoS;
  String algo2S;
  String precioS;
  String utilidadS;

  String? id;

  late TextEditingController nombre;
  late TextEditingController descripcion;
  late TextEditingController algo;
  late TextEditingController algo2;
  late TextEditingController precio;
  late TextEditingController utilidad;

  final _formKey = GlobalKey<FormState>();
  void initVar() {
    nombre = TextEditingController(text: nombreS);
    descripcion = TextEditingController(text: descripcionS);
    algo = TextEditingController(text: algoS);
    algo2 = TextEditingController(text: algo2S);
    precio = TextEditingController(text: precioS);
    utilidad = TextEditingController(text: utilidadS);
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
              "Productos",
              style: Titulos(size: 35),
            ),
            CustTextField(textEditingController: nombre, hint: "Nombre"),
            CustTextField(
                textEditingController: descripcion, hint: "Descripcion"),
            CustTextField(textEditingController: algo, hint: "Algo"),
            CustTextField(textEditingController: algo2, hint: "Algo2"),
            CustTextField(
              textEditingController: precio,
              hint: "Precio",
              textInputType: TextInputType.number,
            ),
            CustTextField(
              textEditingController: utilidad,
              hint: "Utilidad",
              textInputType: TextInputType.number,
            ),
            CustButton(
                text: "REGISTRAR",
                onPress: () async {
                  if (id != null) {
                    var x = await FirebaseProduct().updateProducto(
                        id!,
                        nombre.text,
                        descripcion.text,
                        algo.text,
                        algo2.text,
                        precio.text,
                        utilidad.text);
                    if (x) {
                      Navigator.pop(context);
                    }

                    return;
                  }
                  if (_formKey.currentState!.validate()) {
                    var x = await FirebaseProduct().addProduct(
                        context,
                        nombre.text,
                        descripcion.text,
                        algo.text,
                        algo2.text,
                        precio.text,
                        utilidad.text);
                    if (x) {
                      Navigator.pop(context);
                    }
                  } else {}
                })
          ],
        ),
      ),
    ));
  }
}
