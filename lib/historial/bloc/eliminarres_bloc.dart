import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

part 'eliminarres_event.dart';
part 'eliminarres_state.dart';

class EliminarresBloc extends Bloc<EliminarresEvent, EliminarresState> {
  EliminarresBloc() : super(EliminarresInitial()) {
    on<EliminarHistoriall>(_delFav);
  }
}
Future<void> _delFav(EliminarHistoriall event, Emitter emit) async {
  bool res = await _delRes(event.nombre, event.foto, event.fecha, event.email);
  if (res) {

    String username = 'fernandocb634@gmail.com';
    String password = 'zzvtoxcggqypujvn';
    var usr = FirebaseAuth.instance.currentUser;
    String correo = usr.email;
    String nombreusr = usr.displayName;

    final smtpServer = gmail(username, password);
    final equivalentMessage = Message()
      ..from = Address(username, 'Reserva-T')
      ..recipients.add(Address(event.email))
      ..subject = 'Reservacion para ${nombreusr}:: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html =
          "<h1>Hola ${event.nombre}</h1>\n<p>Se cancelo la reserva de ${nombreusr} de la fecha ${event.fecha}</p>";

    await send(equivalentMessage, smtpServer);

    emit(EliminarresSuccess());
  } else {
    emit(EliminarresError());
  }
}
Future<bool> _delRes(String nombree, String fotoo, String fechaa, String emaill) async {
  Map historial = {'nombre': nombree, 'foto': fotoo, 'fecha': fechaa,"email":emaill};
  try {
    var qUser = await FirebaseFirestore.instance
        .collection("Usuarios")
        .doc("${FirebaseAuth.instance.currentUser.uid}");

    var docsRef = await qUser.get();
    List<dynamic> listHistorial = docsRef.data()["Historial"] ?? [];
    List <Map<String,dynamic>> newList=[];
    
     for(var song in listHistorial){
        if(!mapEquals(song, historial)){
            newList.add(song);
          }
        }



        var qdelete = await FirebaseFirestore.instance
    .collection("Usuarios")
    .doc("${FirebaseAuth.instance.currentUser.uid}")
    .update({'Historial':newList});

    return true;
  } catch (e) {
    print("Error: $e");
    return false;
  }
}