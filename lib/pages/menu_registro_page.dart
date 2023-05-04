import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';
import 'package:productos/pages/usuarios_add_page.dart';
import 'package:productos/widgets/cust_button.dart';
import 'package:productos/widgets/cust_scaffold.dart';

class MenuRegistroPage extends StatelessWidget {
  MenuRegistroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustScaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustButton(
              text: "Usuarios",
              onPress: () async {
                var x = await showDialog(
                    barrierColor: kGray.withOpacity(.75),
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        contentPadding: EdgeInsets.all(50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        backgroundColor: kBackGround.withOpacity(.75),
                        title: Text(
                          "Que decea agregar",
                          style: Titulos(color: kWhite),
                          textAlign: TextAlign.center,
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustButton(
                                text: "usuarios",
                                onPress: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => UserAddPage()));
                                }),
                            CustButton(text: "productos", onPress: () {})
                          ],
                        ),
                      );
                    });
              }),
          CustButton(text: "Ventas", onPress: () {}),
          CustButton(text: "Compras", onPress: () {}),
        ],
      ),
    ));
  }
}
