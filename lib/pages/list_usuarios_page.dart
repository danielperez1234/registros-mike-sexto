import 'package:flutter/material.dart';
import 'package:productos/dialogs/app_alert_dialog.dart';
import 'package:productos/constantes.dart';
import 'package:productos/pages/productos_add_page.dart';
import 'package:productos/pages/usuarios_add_page.dart';
import 'package:productos/sevices/firebaseNetwork.dart';
import 'package:productos/sevices/firebase_producto.dart';
import 'package:productos/sevices/firebase_usuario.dart';
import 'package:productos/widgets/cust_scaffold.dart';

class ListUsuariosPage extends StatelessWidget {
  const ListUsuariosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustScaffold(
        body: Column(
      children: [
        Container(
          height: 60,
          child: Text(
            "Usuarios",
            style: Titulos(
              color: kWhite,
            ),
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
        ),
        StreamBuilder(
          stream: FirebaseUsuarios().streamUsuarios(),
          builder: (context, data) {
            if (data.hasError) return Container();
            if (!data.hasData) return Container();
            return Column(
              children: data.data!.docs
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () async {
                            if (MyFireStore().auth.currentUser?.uid == e.id) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => UserAddPage(
                                            id: e.id,
                                            nombreS: e["nombre"],
                                            apellidoS: e["apellido"],
                                            correoS: e["correo"],
                                            edadS: e["edad"],
                                            generoS: e["genero"],
                                          )));
                            }
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
                            e["edad"] + " Años",
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
