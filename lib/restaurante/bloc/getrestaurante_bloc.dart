import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'getrestaurante_event.dart';
part 'getrestaurante_state.dart';

class GetrestauranteBloc extends Bloc<GetrestauranteEvent, GetrestauranteState> {
  GetrestauranteBloc() : super(GetrestauranteInitial()) {
    on<GetMyRes>(_getRes);
  }

  FutureOr<void> _getRes(event, emit) async {
    String txt = event.text;
      try{
        var query = await FirebaseFirestore.instance
          .collection("Restaurantes")
          .where("Nombre", isGreaterThanOrEqualTo: txt)
          .get();


        var allMyResList = query.docs
          .map((element) => element.data().cast<String, dynamic>())
          .toList();
        

        emit(RespageSuccess(myFav: allMyResList));


      }catch(e){
        print("Error al obtener todos los items");
        emit(RespageError());
      }
    }
}
