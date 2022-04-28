part of 'addfav_bloc.dart';

abstract class AddfavState extends Equatable {
  const AddfavState();
  
  @override
  List<Object> get props => [];
}

class AddfavInitial extends AddfavState {}
class AddfavSucces extends AddfavState {}
class AddfavError extends AddfavState {}
