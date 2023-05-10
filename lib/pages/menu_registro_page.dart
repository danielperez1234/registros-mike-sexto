import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';
import 'package:productos/pages/compras_page.dart';
import 'package:productos/pages/list_products_page.dart';
import 'package:productos/pages/productos_add_page.dart';
import 'package:productos/pages/usuarios_add_page.dart';
import 'package:productos/pages/ventas_page.dart';
import 'package:productos/widgets/cust_button.dart';
import 'package:productos/widgets/cust_scaffold.dart';

class MenuRegistroPage extends StatelessWidget {
  const MenuRegistroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustScaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustButton(
              text: "Registrar".toUpperCase(),
              onPress: () async {
                var x = await showDialog(
                    barrierColor: kGray.withOpacity(.75),
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        contentPadding: const EdgeInsets.all(50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        backgroundColor: kBackGround.withOpacity(.75),
                        title: Text(
                          "Que desea agregar",
                          style: Titulos(color: kWhite),
                          textAlign: TextAlign.center,
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustButton(
                                text: "usuarios".toUpperCase(),
                                onPress: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => UserAddPage()));
                                }),
                            CustButton(
                                text: "productos".toUpperCase(),
                                onPress: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => ProductosAddPage()));
                                })
                          ],
                        ),
                      );
                    });
              }),
          CustButton(
              text: "Catalogos",
              onPress: () async {
                var x = await showDialog(
                    barrierColor: kGray.withOpacity(.75),
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        contentPadding: const EdgeInsets.all(50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        backgroundColor: kBackGround.withOpacity(.75),
                        title: Text(
                          "Que desea ver",
                          style: Titulos(color: kWhite),
                          textAlign: TextAlign.center,
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustButton(
                                text: "usuarios".toUpperCase(),
                                onPress: () {
                                  Navigator.pop(context);
                                  /*Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => UserAddPage()));*/
                                }),
                            CustButton(
                                text: "productos".toUpperCase(),
                                onPress: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => ListProductsPage()));
                                })
                          ],
                        ),
                      );
                    });
              }),
          CustButton(
              text: "Ventas",
              onPress: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => VentasPage()));
              }),
          CustButton(
              text: "Compras",
              onPress: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ComprasPage()));
              }),
        ],
      ),
    ));
  }
}
