part of 'deleteitem_bloc.dart';

abstract class DeleteitemState extends Equatable {
  const DeleteitemState();
  
  @override
  List<Object> get props => [];
}

class DeleteitemInitial extends DeleteitemState {}
class DeleteSuccess extends DeleteitemState {}
class DeleteError extends DeleteitemState {}
