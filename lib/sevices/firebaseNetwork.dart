import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyFireStore {
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('product');
  final CollectionReference usrCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference ventasCollection =
      FirebaseFirestore.instance.collection('ventas');
  final CollectionReference comprasCollection =
      FirebaseFirestore.instance.collection('compras');
  final auth = FirebaseAuth.instance;
  Future<bool> register(BuildContext context, String email, String password,
      String genero, String nombre, String edad, String apellido) async {
    try {
      var usrNew = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      usrCollection.doc(usrNew.user!.uid).set({
        "nombre": nombre,
        "correo": email,
        "genero": genero,
        "edad": edad,
        "apellido": apellido
      });
      return true;
    } catch (ex) {
      await showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(
                "Error",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
              content: Text(ex.toString()),
            );
          });
      return false;
    }
  }

  Future<bool> login(String user, String password, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(email: user, password: password);
      return true;
    } catch (ex) {
      await showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(
                "Error",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
              content: Text(ex.toString()),
            );
          });
      return false;
    }
  }

  /*Future AddMessage(String msg, String userMail) async {
    final list = [
      userMail,
      _auth.currentUser?.email ?? "",
    ];
    list.sort((a, b) => a.compareTo(b));
    await chatCollection.doc(list[0] + list[1]).set({
      'email': list[0],
      'emailV': list[1],
      'last_At': FieldValue.serverTimestamp()
    });
    return await chatCollection
        .doc(list[0] + list[1])
        .collection('mensajes')
        .add({
      'created_At': FieldValue.serverTimestamp(),
      'mensaje': msg,
      'visto': 0,
      'emisor': _auth.currentUser?.email,
    });
  }

  Stream<QuerySnapshot<Object?>> GetAllUsers() {
    return usrCollection.snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> GetMessage(String userMail) {
    final list = [
      userMail,
      _auth.currentUser?.email ?? "",
    ];
    print(list.asMap());
    list.sort((a, b) => a.compareTo(b));

    return chatCollection
        .doc(list[0] + list[1])
        .collection('mensajes')
        .orderBy('created_At', descending: true)
        .snapshots();
  }

  UpdateMessage(String userMail) async {
    final list = [
      userMail,
      _auth.currentUser?.email ?? "",
    ];
    list.sort((a, b) => a.compareTo(b));

    Map<String, dynamic> data = {
      'visto': 1,
    };
    Map<String, dynamic> datafecha = {
      'last_At': FieldValue.serverTimestamp(),
    };
    try {
      chatCollection
          .doc(list[0] + list[1])
          .set({'email': list[0], 'emailV': list[1], 'last_At': null});
      var fecha = await chatCollection.doc(list[0] + list[1]).get();
      fecha.reference.update(datafecha);

      var snap = chatCollection
          .doc(list[0] + list[1])
          .collection('mensajes')
          .where('visto', isEqualTo: 0)
          .where('emisor', isEqualTo: userMail)
          .get()
          .then((value) => value.docs.forEach((element) {
                element.reference.update(data);
              }));
    } catch (ex) {}
  }
*/
  /*get mensajes {
    return chatCollection
        .doc(userid)
        .collection('mensajes')
        .where('visto', isEqualTo: 0)
        .where('emisor', isEqualTo: 'v')
        .snapshots();
  }*/

  //////////////////////////////
}
