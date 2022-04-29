part of 'getuserinfo_bloc.dart';

abstract class GetUserInfoState extends Equatable {
  const GetUserInfoState();

  @override
  List<Object> get props => [];
}

class GetUserInfoInitial extends GetUserInfoState {}

class GetUserInfoSuccess extends GetUserInfoState {
  final Map mapa;

  GetUserInfoSuccess({this.mapa});

  @override
  List<Object> get props => [mapa];
}

class GetUserInfoError extends GetUserInfoState {}
