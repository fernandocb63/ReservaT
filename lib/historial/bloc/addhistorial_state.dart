part of 'addhistorial_bloc.dart';

abstract class AddhistorialState extends Equatable {
  const AddhistorialState();

  @override
  List<Object> get props => [];
}

class AddhistorialInitial extends AddhistorialState {}

class AddHistorialSucces extends AddhistorialState {}

class AddHistorialError extends AddhistorialState {}
