import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reserva_t/restaurante/bloc/getrestaurante_bloc.dart';
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
    // String txt ='V';

    return Stack(
      children:[  
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
              controller: textController,
              onChanged: (val){
                BlocProvider.of<GetrestauranteBloc>(context).add(GetMyRes(text: val));               
              },
              decoration: InputDecoration(border: OutlineInputBorder(), 
              hintText: "Ingresa tu busqueda",
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.navigate_next_outlined))),
        ),
        
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
          child: BlocConsumer<GetrestauranteBloc, GetrestauranteState>(
          listener: (context, state) {
            //Show snackbar
          },
          builder: (context, state) {
            if(state is RespageLoading){
              return ListView.builder(
                itemCount: 25,
                itemBuilder: (BuildContext context, int index){
                  return YoutubeShimmer();
                },
              );
            } else if(state is RespageVacio){
              return Center(
                child: Text("No hay datos por mostrar"),
              );
            } else if (state is RespageSuccess){
              return 
              Stack(
                children:[ 
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child:
                    ListView.builder(
                    itemCount: state.myFav.length,
                    itemBuilder: (BuildContext context, int index){
                      return Resturantes(publicFData: state.myFav[index]);
                    }),
                  ),                
                  ]
              );
            }else {
              return Center(child: CircularProgressIndicator());
            }
          },
      ),
        ),
      ]
    );
  }
}