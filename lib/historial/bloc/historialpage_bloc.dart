import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';


part 'historialpage_event.dart';
part 'historialpage_state.dart';

class HistorialpageBloc extends Bloc<HistorialpageEvent, HistorialpageState> {
  HistorialpageBloc() : super(HistorialpageInitial()) {
    on<GetMyHistorial>(_getHist);
  }

  FutureOr<void> _getHist(event, emit) async {
      try{
        var queryUser = await FirebaseFirestore.instance
          .collection("Usuarios")
          .doc("${FirebaseAuth.instance.currentUser.uid}");

        var docsRef = await queryUser.get();
        List<dynamic> listIds = docsRef.data()["Historial"] ?? [];

        emit(HistorialSuccess(myHist: listIds));


      }catch(e){
        print("Error al obtener todos los items");
        emit(HistorialError());
      }
    }
}
