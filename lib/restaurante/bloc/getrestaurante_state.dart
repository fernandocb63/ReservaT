part of 'getrestaurante_bloc.dart';

abstract class GetrestauranteState extends Equatable {
  const GetrestauranteState();
  
  @override
  List<Object> get props => [];
}

class GetrestauranteInitial extends GetrestauranteState {}


class RespageSuccess extends GetrestauranteState {
  final List<Map<String,dynamic>> myFav;
  
  RespageSuccess({this.myFav});

  @override
  List<Object> get props => [myFav];
}

class RespageLoading extends GetrestauranteState {}

class RespageError extends GetrestauranteState {}
class RespageVacio extends GetrestauranteState {}
