import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'favpage_event.dart';
part 'favpage_state.dart';

class FavpageBloc extends Bloc<FavpageEvent, FavpageState> {
  FavpageBloc() : super(FavpageInitial()) {
    on<FavpageEvent>(_getfav );
  }
  FutureOr<void> _getfav(event, emit) async {
      try{
        var queryUser = await FirebaseFirestore.instance
          .collection("Usuarios")
          .doc("${FirebaseAuth.instance.currentUser.uid}");

        var docsRef = await queryUser.get();
        var listIds = docsRef.data()["Favoritos"] ?? [];
        print(listIds);

        var queryFotos = await FirebaseFirestore.instance
          .collection("Restaurantes").orderBy('Nombre')
          .get();

        var allMyFotosList = queryFotos.docs
          .where((element) => listIds.contains(element.id))
          .map((element) => element.data().cast<String, dynamic>())
          .toList();
        print(allMyFotosList);

        emit(FavpageSuccess(myFav: allMyFotosList));


      }catch(e){
        print("Error al obtener todos los items");
        emit(FavpageError());
      }
    }



}
