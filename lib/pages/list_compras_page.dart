import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:productos/dialogs/app_alert_dialog.dart';
import 'package:productos/constantes.dart';
import 'package:productos/pages/compras_page.dart';
import 'package:productos/pages/productos_add_page.dart';
import 'package:productos/pages/ventas_page.dart';
import 'package:productos/sevices/firebase_compras.dart';
import 'package:productos/sevices/firebase_producto.dart';
import 'package:productos/sevices/firebase_ventas.dart';
import 'package:productos/widgets/cust_scaffold.dart';

class ListComprasPage extends StatelessWidget {
  const ListComprasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustScaffold(
        body: Column(
      children: [
        Container(
          height: 60,
          child: Text(
            "Compras",
            style: Titulos(
              color: kWhite,
            ),
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
        ),
        StreamBuilder(
          stream: FirebaseCompras().streamAll(),
          builder: (context, data) {
            if (data.hasError) return Container();
            if (!data.hasData) return Container();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: data.data!.docs
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ComprasPage(
                                          idProducto: e["idProducto"],
                                          nombre: e["nombre"],
                                          idAdmin: e["ida"],
                                          piezas: e["piezas"],
                                          id: e.id,
                                        )));
                          },
                          onLongPress: () async {
                            appAlertDialog(context, "Eliminar",
                                "¿Desea eliminar el venta?",
                                actionNo: "Eliminar",
                                onActionNo: () {
                                  FirebaseCompras().eliminar(e.id);
                                  Navigator.pop(context);
                                },
                                actionOk: "Cancelar",
                                onActionOk: () {
                                  Navigator.pop(context);
                                });
                          },
                          tileColor: kWhite.withOpacity(.24),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StreamBuilder(
                                  stream: FirebaseProduct()
                                      .getProduct(e["idProducto"]),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) return Container();
                                    if (!snapshot.hasData) return Container();
                                    return Text(
                                      "Producto: " + snapshot.data!["nombre"],
                                      style: Chicos(color: kWhite),
                                    );
                                  }),
                              Text("Cantidad: ${e["piezas"]}",
                                  style: Chicos(color: kWhite)),
                              Text("Administrador: ${(e["ida"])}",
                                  style: Chicos(color: kWhite))
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            );
          },
        ),
      ],
    ));
  }
}
