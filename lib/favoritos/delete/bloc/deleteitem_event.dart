part of 'deleteitem_bloc.dart';

abstract class DeleteitemEvent extends Equatable {
  const DeleteitemEvent();

  @override
  List<Object> get props => [];
}

class DeleteMyFav extends DeleteitemEvent{
  final String deleteid;

  DeleteMyFav({this.deleteid});

  @override
  List<Object> get props => [deleteid];

}