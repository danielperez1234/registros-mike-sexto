import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';
import 'package:productos/sevices/firebaseNetwork.dart';

class FirebaseProduct extends MyFireStore {
  Future addProduct(BuildContext context, String nombre, String descripcion,
      String algo, String algo2, String precio, String utilidad) async {
    try {
      await productCollection.add({
        "nombre": nombre,
        "descripcion": descripcion,
        "algo": algo,
        "algo2": algo2,
        "precio": precio,
        "utilidad": utilidad
      });
      return true;
    } catch (ex) {
      await showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text(
                  "Error",
                  style: TextStyle(color: kRed, fontSize: 20),
                ),
                content: Text(ex.toString()),
              ));
      return false;
    }
  }

  Stream<QuerySnapshot<Object?>> streamProducts() {
    return productCollection.snapshots();
  }
}
