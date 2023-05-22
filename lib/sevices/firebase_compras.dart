import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';
import 'package:productos/sevices/firebaseNetwork.dart';

class FirebaseCompras extends MyFireStore {
  Future<bool> add(
    BuildContext context,
    String idProducto,
    String idVendedor,
    String nombre,
    String piezas,
  ) async {
    try {
      await comprasCollection.add({
        "idProducto": idProducto,
        "ida": idVendedor,
        "nombre": nombre,
        "piezas": piezas,
      });
      var ext = await productCollection.doc(idProducto).get();
      await productCollection.doc(idProducto).update({
        "algo": ((int.tryParse(ext["algo"]) ?? 0) + (int.tryParse(piezas) ?? 0))
            .toString()
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

  Stream<QuerySnapshot<Object?>> streamAll() {
    return comprasCollection.snapshots();
  }

  eliminar(String path) {
    comprasCollection.doc(path).delete();
  }

  Stream<DocumentSnapshot<Object?>> getCompra(String id) {
    return comprasCollection.doc(id).snapshots();
  }

  Future<bool> update(String id, String idProducto, String idVendedor,
      String nombre, String piezasNew, String diff) async {
    try {
      await comprasCollection.doc(id).set({
        "idProducto": idProducto,
        "ida": idVendedor,
        "nombre": nombre,
        "piezas": piezasNew,
      });
      var ext = await productCollection.doc(idProducto).get();
      await productCollection.doc(idProducto).update({
        "algo": ((int.tryParse(ext["algo"]) ?? 0) + (int.tryParse(diff) ?? 0))
            .toString()
      });
      return true;
    } catch (ex) {
      return false;
    }
  }
}
