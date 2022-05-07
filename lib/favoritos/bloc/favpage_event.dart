part of 'favpage_bloc.dart';

@immutable
abstract class FavpageEvent extends Equatable{
    const FavpageEvent();

  @override
  List<Object> get props => [];
}

class GetMyFavorites extends FavpageEvent{
  String text;


  GetMyFavorites({this.text});

  @override
  List<Object> get props => [text];
}
