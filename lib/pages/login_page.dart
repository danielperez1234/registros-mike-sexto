import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';
import 'package:productos/pages/menu_registro_page.dart';
import 'package:productos/pages/usuarios_add_page.dart';
import 'package:productos/widgets/cust_TextField.dart';
import 'package:productos/widgets/cust_button.dart';
import 'package:productos/widgets/cust_scaffold.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final usuario = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustScaffold(
      body: Column(
        children: [
          Center(
              child: Text("log - in", style: Titulos(color: kWhite, size: 35))),
          Container(
            height: MediaQuery.of(context).size.height * 2 / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                CustTextField(
                  textEditingController: usuario,
                  hint: 'Usuario',
                ),
                CustTextField(
                  textEditingController: password,
                  hint: 'Contraseña',
                  isObscure: true,
                ),
                CustButton(
                    text: "Ingresar",
                    onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => MenuRegistroPage()));
                    })
              ],
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => UserAddPage()));
              },
              child: Text(
                'registrar',
                style: Medianos(
                    color: kWhite, decoration: TextDecoration.underline),
              ),
            ),
          )
        ],
      ),
    );
  }
}