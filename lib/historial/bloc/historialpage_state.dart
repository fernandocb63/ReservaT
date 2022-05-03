part of 'historialpage_bloc.dart';

abstract class HistorialpageState extends Equatable {
  const HistorialpageState();
  
  @override
  List<Object> get props => [];
}

class HistorialpageInitial extends HistorialpageState {}

class HistorialSuccess extends HistorialpageState {
    final List<dynamic> myHist;


  HistorialSuccess({this.myHist});

  @override
  List<Object> get props => [myHist];
}

class HistorialLoading extends HistorialpageState {}

class HistorialError extends HistorialpageState {}
class HistorialVacio extends HistorialpageState {}
