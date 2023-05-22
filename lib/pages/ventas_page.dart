import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';
import 'package:productos/sevices/firebaseNetwork.dart';
import 'package:productos/sevices/firebase_producto.dart';
import 'package:productos/sevices/firebase_ventas.dart';
import 'package:productos/widgets/cust_TextField.dart';
import 'package:productos/widgets/cust_TextFixed.dart';
import 'package:productos/widgets/cust_TextSelect.dart';
import 'package:productos/widgets/cust_button.dart';
import 'package:productos/widgets/cust_scaffold.dart';

class VentasPage extends StatefulWidget {
  VentasPage(
      {Key? key,
      this.idCliente = "",
      this.idProducto = "",
      this.idVendedor = "",
      this.piezas = "",
      this.id})
      : super(key: key);
  String idCliente;
  String idProducto;
  String idVendedor;
  String piezas;
  String? id;
  @override
  State<VentasPage> createState() => _VentasPageState();
}

class _VentasPageState extends State<VentasPage> {
  final _formKey = GlobalKey<FormState>();
  var idProduct = "";
  var nombre = "";
  var existencia = 0;
  var idCliente = TextEditingController();
  var piezas = TextEditingController();
  var difPiezas = 0;
  double subTotal = 0;
  double total = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.id != null) {
      idProduct = widget.idProducto;
      idCliente.text = widget.idCliente;
      piezas.text = widget.piezas;
    }
  }

  void calc(String price) {
    subTotal =
        (double.tryParse(price) ?? 0.0) * (int.tryParse(piezas.text) ?? 0);
    total = subTotal * 1.16;
    difPiezas =
        (int.tryParse(piezas.text) ?? 0) - (int.tryParse(widget.piezas) ?? 0);
    print(total.toString() + "  " + subTotal.toString());
  }

  @override
  Widget build(BuildContext context) {
    return CustScaffold(
        body: Form(
      key: _formKey,
      child: Center(
        child: StreamBuilder<Object>(
            stream: idProduct != ""
                ? FirebaseProduct().getProduct(idProduct)
                : null,
            builder: (context, snapshot) {
              if (idProduct != "") {
                if (snapshot.hasError) return Container();
                if (!snapshot.hasData) return Container();
                calc((snapshot.data! as DocumentSnapshot<Object?>)["precio"]);
                nombre =
                    (snapshot.data! as DocumentSnapshot<Object?>)["nombre"];
                existencia = int.tryParse((snapshot.data!
                        as DocumentSnapshot<Object?>)["algo"]) ??
                    0;
              }

              return Column(
                children: [
                  Text(
                    "ventas",
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
                  CustTextFixed(text: nombre, hint: "Nombre"),
                  CustTextFixed(
                      text: existencia.toString(), hint: "Existencia"),
                  CustTextFixed(
                    text: widget.id != null
                        ? widget.id!
                        : MyFireStore().auth.currentUser!.uid,
                    hint: "Id Vendedor",
                  ),
                  CustTextField(
                    textEditingController: idCliente,
                    hint: "ID cliente",
                    textInputType:
                        TextInputType.numberWithOptions(decimal: false),
                  ),
                  CustTextField(
                    textEditingController: piezas,
                    hint: "Piezas",
                    onChange: (s) {
                      if ((int.tryParse(piezas.text) ?? 0) > existencia) {
                        piezas = TextEditingController.fromValue(
                            TextEditingValue(
                                text: existencia.toString(),
                                selection: TextSelection.collapsed(offset: 2)));
                        setState(() {});
                        return;
                      }
                      if (idProduct != "")
                        calc((snapshot.data!
                            as DocumentSnapshot<Object?>)["precio"]);
                      setState(() {});
                    },
                    textInputType:
                        TextInputType.numberWithOptions(decimal: false),
                  ),
                  CustTextFixed(
                      text: subTotal.toStringAsFixed(2), hint: "Sub Total"),
                  CustTextFixed(text: total.toStringAsFixed(2), hint: "Total"),
                  CustButton(
                      text: "REGISTRAR",
                      onPress: () async {
                        if (_formKey.currentState!.validate()) {
                          if (widget.id != null) {
                            var flag = await FirebaseVentas().updateVenta(
                                widget.id!,
                                idProduct,
                                widget.idVendedor,
                                idCliente.text,
                                piezas.text,
                                ((existencia) + difPiezas).toString(),
                                subTotal.toString(),
                                total.toString());
                            if (flag) {
                              Navigator.pop(context);
                              return;
                            }
                          }
                          var flag = await FirebaseVentas().addVenta(
                              context,
                              idProduct,
                              MyFireStore().auth.currentUser!.uid,
                              idCliente.text,
                              piezas.text,
                              ((existencia) + difPiezas).toString(),
                              subTotal.toString(),
                              total.toString());
                          if (flag) {
                            Navigator.pop(context);
                          }
                        } else {}
                      })
                ],
              );
            }),
      ),
    ));
  }
}
