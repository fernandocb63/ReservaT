part of 'addfav_bloc.dart';

abstract class AddfavEvent extends Equatable {
  const AddfavEvent();

  @override
  List<Object> get props => [];
}


class addFavorite extends AddfavEvent{
  String id;


  addFavorite({this.id});
  @override
  List<Object> get props => [id];

}