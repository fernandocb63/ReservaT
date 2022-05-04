part of 'eliminarres_bloc.dart';

abstract class EliminarresEvent extends Equatable {
  const EliminarresEvent();

  @override
  List<Object> get props => [];
}
class EliminarHistoriall extends EliminarresEvent {
  String nombre;
  String foto;
  String fecha;
  String email;

  EliminarHistoriall({this.nombre, this.foto, this.fecha, this.email});
  @override
  List<Object> get props => [nombre, foto, fecha, email];
}