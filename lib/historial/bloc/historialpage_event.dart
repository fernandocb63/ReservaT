part of 'historialpage_bloc.dart';

abstract class HistorialpageEvent extends Equatable {
  const HistorialpageEvent();

  @override
  List<Object> get props => [];
}

class GetMyHistorial extends HistorialpageEvent{}