import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'addhistorial_event.dart';
part 'addhistorial_state.dart';

class AddhistorialBloc extends Bloc<AddhistorialEvent, AddhistorialState> {
  AddhistorialBloc() : super(AddhistorialInitial()) {
    on<AddHistoriall>(_setHistorial);
  }
}

Future<void> _setHistorial(AddHistoriall event, Emitter emit) async {
  bool res = await _saveHistorial(event.nombre, event.foto, event.fecha);
  if (res) {
    emit(AddHistorialSucces());
  } else {
    emit(AddHistorialError());
  }
}

Future<bool> _saveHistorial(String nombree, String fotoo, String fechaa) async {
  Map historial = {'nombre': nombree, 'foto': fotoo, 'fecha': fechaa};
  try {
    var qUser = await FirebaseFirestore.instance
        .collection("Usuarios")
        .doc("${FirebaseAuth.instance.currentUser.uid}");

    var docsRef = await qUser.get();
    List<dynamic> listHistorial = docsRef.data()["Historial"] ?? [];

    listHistorial.add(historial);

    print(historial);



    await qUser.update({"Historial": listHistorial});
    return true;
  } catch (e) {
    print("Error: $e");
    return false;
  }
}
