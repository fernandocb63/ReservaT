part of 'eliminarres_bloc.dart';

abstract class EliminarresState extends Equatable {
  const EliminarresState();
  
  @override
  List<Object> get props => [];
}

class EliminarresInitial extends EliminarresState {}
class EliminarresSuccess extends EliminarresState {}
class EliminarresError extends EliminarresState {}
