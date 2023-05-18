import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';
import 'package:productos/sevices/firebase_producto.dart';

Future<String> appSelectIdProductoDialog(BuildContext context) async {
  var resultado = "";
  await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            "Selecciona un producto",
            style: Medianos(color: kRed),
          ),
          content: StreamBuilder(
            stream: FirebaseProduct().streamProducts(),
            builder: (context, data) {
              if (data.hasError) return Container();
              if (!data.hasData) return Container();
              return Column(
                children: data.data!.docs
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () {
                              resultado = e.id;
                              Navigator.pop(context);
                            },
                            tileColor: Colors.black26,
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
        );
      });
  return resultado;
}
