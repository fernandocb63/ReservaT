part of 'getuserinfo_bloc.dart';

abstract class GetUserInfoEvent extends Equatable {
  const GetUserInfoEvent();

  @override
  List<Object> get props => [];
}

class GetInfo extends GetUserInfoEvent {}
