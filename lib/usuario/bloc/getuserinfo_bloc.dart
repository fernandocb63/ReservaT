import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'getuserinfo_event.dart';
part 'getuserinfo_state.dart';

class GetUserInfoBloc extends Bloc<GetUserInfoEvent, GetUserInfoState> {
  GetUserInfoBloc() : super(GetUserInfoInitial()) {
    on<GetInfo>(getUsrInfo);
  }

  FutureOr<void> getUsrInfo(event, emit) async {
    Map result = await getInfo();
    if (result == null) {
      emit(GetUserInfoError());
    } else {
      print(result['image']);
      print(result['nombre']);
      emit(GetUserInfoSuccess(mapa: result));
    }
  }
}

Future getInfo() async {
  Map mapa = {'image': '', 'nombre': ''};
  try {
    var usr = FirebaseAuth.instance.currentUser;
    mapa['image'] = usr.photoURL;
    mapa['nombre'] = usr.displayName;
    return mapa;
  } catch (e) {
    return null;
    print(e);
  }
}
