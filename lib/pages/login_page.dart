import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';
import 'package:productos/pages/menu_registro_page.dart';
import 'package:productos/pages/usuarios_add_page.dart';
import 'package:productos/sevices/firebaseNetwork.dart';
import 'package:productos/widgets/cust_TextField.dart';
import 'package:productos/widgets/cust_button.dart';
import 'package:productos/widgets/cust_scaffold.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final usuario = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustScaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Center(child: Text("log - in", style: Titulos(size: 35))),
            SizedBox(
              height: MediaQuery.of(context).size.height * 2 / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustTextField(
                    textEditingController: usuario,
                    textInputType: TextInputType.emailAddress,
                    hint: 'Correo',
                  ),
                  CustTextField(
                    textEditingController: password,
                    hint: 'Contraseña',
                    isObscure: true,
                  ),
                  CustButton(
                      text: "Ingresar",
                      onPress: () async {
                        if (_formKey.currentState!.validate()) {
                          var f = await MyFireStore()
                              .login(usuario.text, password.text, context);
                          if (f) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const MenuRegistroPage()));
                          } else {}
                        }
                      })
                ],
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () async {
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
      ),
    );
  }
}
