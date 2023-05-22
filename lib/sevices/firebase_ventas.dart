import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';
import 'package:productos/sevices/firebaseNetwork.dart';
import 'package:productos/sevices/firebase_producto.dart';

class FirebaseVentas extends MyFireStore {
  Future<bool> addVenta(
      BuildContext context,
      String idProducto,
      String idVendedor,
      String idCliente,
      String piezas,
      String subTotal,
      String NewEx,
      String total) async {
    try {
      await ventasCollection.add({
        "idProducto": idProducto,
        "idVendedor": idVendedor,
        "idCliente": idCliente,
        "piezas": piezas,
        "subTotal": subTotal,
        "total": total
      });
      FirebaseProduct().updateExistencia(idProducto, NewEx);
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

  Stream<QuerySnapshot<Object?>> streamVentas() {
    return ventasCollection.snapshots();
  }

  eliminarVenta(String path) {
    ventasCollection.doc(path).delete();
  }

  Stream<DocumentSnapshot<Object?>> getVenta(String id) {
    return ventasCollection.doc(id).snapshots();
  }

  Future<bool> updateVenta(
      String id,
      String idProducto,
      String idVendedor,
      String idCliente,
      String piezas,
      String NewEx,
      String subTotal,
      String total) async {
    try {
      await ventasCollection.doc(id).set({
        "idProducto": idProducto,
        "idVendedor": idVendedor,
        "idCliente": idCliente,
        "piezas": piezas,
        "subTotal": subTotal,
        "total": total
      });
      await FirebaseProduct().updateExistencia(idProducto, NewEx);
      return true;
    } catch (ex) {
      return false;
    }
  }
}
