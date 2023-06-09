import 'package:flutter/material.dart';
import 'package:productos/dialogs/app_alert_dialog.dart';
import 'package:productos/constantes.dart';
import 'package:productos/pages/productos_add_page.dart';
import 'package:productos/sevices/firebase_producto.dart';
import 'package:productos/widgets/cust_scaffold.dart';

class ListProductsPage extends StatelessWidget {
  const ListProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustScaffold(
        body: Column(
      children: [
        Container(
          height: 60,
          child: Text(
            "Productos",
            style: Titulos(
              color: kWhite,
            ),
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
        ),
        StreamBuilder(
          stream: FirebaseProduct().streamProducts(),
          builder: (context, data) {
            if (data.hasError) return Container();
            if (!data.hasData) return Container();
            return Column(
              children: data.data!.docs
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ProductosAddPage(
                                          nombreS: e["nombre"],
                                          descripcionS: e["descripcion"],
                                          algoS: e["algo"],
                                          algo2S: e["algo2"],
                                          precioS: e["precio"],
                                          utilidadS: e["utilidad"],
                                          id: e.id,
                                        )));
                          },
                          onLongPress: () async {
                            appAlertDialog(context, "Eliminar",
                                "¿Desea eliminar el producto?",
                                actionNo: "Eliminar",
                                onActionNo: () {
                                  FirebaseProduct().eliminarProducto(e.id);
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
                          title: Text(
                            e["nombre"],
                            style: Medianos(color: kWhite),
                          ),
                          trailing: Text(
                            r'$' + e["precio"],
                            style: Chicos(color: kGray),
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
