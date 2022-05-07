part of 'getrestaurante_bloc.dart';

abstract class GetrestauranteEvent extends Equatable {
  const GetrestauranteEvent();

  @override
  List<Object> get props => [];
}

class GetMyRes extends GetrestauranteEvent{
  String text;


  GetMyRes({this.text});

  @override
  List<Object> get props => [text];
}
