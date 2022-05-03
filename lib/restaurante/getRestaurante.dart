import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reserva_t/restaurante/restaurantes.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_firestore/firebase_firestore.dart';

class ResU extends StatefulWidget {
  const ResU({Key key}) : super(key: key);

  @override
  State<ResU> createState() => _ResUState();
}

class _ResUState extends State<ResU> {
  @override
  Widget build(BuildContext context) {
    // List<dynamic> res=[];
    TextEditingController textController = TextEditingController();
    String txt ='';
    Future<void> _getres(String val) async {
      
      List<DocumentSnapshot> documentList;
      var equisde = FirebaseFirestore.instance
                  .collection("Restaurantes").get();

      print(equisde.toString());


    }

    return Stack(
      
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
              controller: textController,
              onChanged: (val){
                // print(val);
                _getres(val);
                setState(() {
                // txt = val;
                  
                });
                // print(res);
              },
              decoration: InputDecoration(border: OutlineInputBorder(), 
              hintText: "Ingresa tu busqueda",
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.navigate_next_outlined))),
        ),
        
        
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
          child: FirestoreListView(
          query: FirebaseFirestore.instance
            .collection("Restaurantes")
            // .where("Nombre", isGreaterThanOrEqualTo: txt)
            ,
          itemBuilder: (BuildContext context, QueryDocumentSnapshot<Map<String,dynamic>> document){
            print(document.data());
            return Column(
              children: [
                Resturantes(publicFData: document.data(), docid: document.id,),
              ],
            );
          }
      ),
        ),
      ]
      
      );
  }
}