import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';
import 'package:productos/sevices/firebase_compras.dart';
import 'package:productos/sevices/firebase_producto.dart';
import 'package:productos/widgets/cust_TextField.dart';
import 'package:productos/widgets/cust_TextFixed.dart';
import 'package:productos/widgets/cust_TextSelect.dart';
import 'package:productos/widgets/cust_scaffold.dart';

import '../widgets/cust_button.dart';

class ComprasPage extends StatefulWidget {
  ComprasPage(
      {Key? key,
      this.id,
      this.idProducto = "",
      this.nombre = "",
      this.piezas = "",
      this.idAdmin = ""})
      : super(key: key);
  String idProducto;
  String idAdmin;
  String nombre;
  String piezas;
  String? id;
  @override
  State<ComprasPage> createState() => _ComprasPageState();
}

class _ComprasPageState extends State<ComprasPage> {
  final _formKey = GlobalKey<FormState>();

  String idProduct = "";

  var piezas = TextEditingController();
  String nombre = "";
  var idAdmin = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.id != null) {
      idProduct = widget.idProducto;
      piezas.text = widget.piezas;
      nombre = widget.piezas;
      idAdmin.text = widget.idAdmin;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustScaffold(
        body: Form(
      key: _formKey,
      child: Center(
        child: Column(
          children: [
            Text(
              "compras",
              style: Titulos(size: 35),
            ),
            widget.id != null
                ? CustTextFixed(text: idProduct, hint: "Id producto")
                : CustTextSelect(
                    onSelect: (s) {
                      idProduct = s;
                      setState(() {});
                    },
                    hint: "Id productos"),
            if (idProduct != "")
              StreamBuilder(
                  stream: FirebaseProduct().getProduct(idProduct),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      nombre = snapshot.data!["nombre"];
                    }
                    return CustTextFixed(
                        text: snapshot.data?["nombre"] ?? "nombre",
                        hint: "nombre");
                  }),
            CustTextField(
              textEditingController: piezas,
              hint: "Piezas",
              textInputType: TextInputType.numberWithOptions(decimal: false),
            ),
            CustTextField(
              textEditingController: idAdmin,
              hint: "ID administrador",
              textInputType: TextInputType.numberWithOptions(decimal: false),
            ),
            CustButton(
                text: "REGISTRAR",
                onPress: () async {
                  if (_formKey.currentState!.validate()) {
                    if (widget.id != null) {
                      var flag = await FirebaseCompras().update(
                          widget.id!,
                          idProduct,
                          idAdmin.text,
                          nombre,
                          piezas.text,
                          ((int.tryParse(piezas.text) ?? 0) -
                                  (int.tryParse(widget.piezas) ?? 0))
                              .toString());
                      if (flag) {
                        Navigator.pop(context);
                      }
                      return;
                    }
                    FirebaseCompras().add(
                        context, idProduct, idAdmin.text, nombre, piezas.text);
                    Navigator.pop(context);
                  } else {}
                })
          ],
        ),
      ),
    ));
  }
}
