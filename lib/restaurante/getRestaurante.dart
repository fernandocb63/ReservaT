import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reserva_t/restaurante/restaurantes.dart';

class ResU extends StatelessWidget {
  const ResU({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirestoreListView(
      query: FirebaseFirestore.instance
        .collection("Restaurantes"),
      itemBuilder: (BuildContext context, QueryDocumentSnapshot<Map<String,dynamic>> document){
        print(document.data());
        return Resturantes(publicFData: document.data(), docid: document.id,);
      }
    );
  }
}