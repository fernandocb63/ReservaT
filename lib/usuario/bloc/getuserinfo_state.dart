part of 'getuserinfo_bloc.dart';

abstract class GetUserInfoState extends Equatable {
  const GetUserInfoState();

  @override
  List<Object> get props => [];
}

class GetUserInfoInitial extends GetUserInfoState {}

class GetUserInfoSuccess extends GetUserInfoState {
  final String foto;
  final String nombreUsr;

  GetUserInfoSuccess({this.foto, this.nombreUsr});

  @override
  List<Object> get props => [foto, nombreUsr];
}

class GetUserInfoError extends GetUserInfoState {}
