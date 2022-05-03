part of 'addhistorial_bloc.dart';

abstract class AddhistorialEvent extends Equatable {
  const AddhistorialEvent();

  @override
  List<Object> get props => [];
}

class AddHistoriall extends AddhistorialEvent {
  String nombre;
  String foto;
  String fecha;

  AddHistoriall({this.nombre, this.foto, this.fecha});
  @override
  List<Object> get props => [nombre, foto, fecha];
}
