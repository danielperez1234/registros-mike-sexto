import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';
import 'package:productos/sevices/firebaseNetwork.dart';

class FirebaseUsuarios extends MyFireStore {
  Stream<QuerySnapshot<Object?>> streamUsuarios() {
    return usrCollection.snapshots();
  }

  Future<bool> eliminarProducto(String path) async {
    try {
      auth.currentUser!.delete();
      productCollection.doc(path).delete();
      return true;
    } catch (exx) {}
    return false;
  }

  Future<bool> updateUsuario(String id, String email, String? password,
      String genero, String nombre, String edad, String apellido) async {
    try {
      if (password != null) auth.currentUser!.updatePassword(password);
      await usrCollection.doc(id).set({
        "nombre": nombre,
        "correo": email,
        "genero": genero,
        "edad": edad,
        "apellido": apellido
      });
      return true;
    } catch (ex) {
      return false;
    }
  }
}
