part of 'favpage_bloc.dart';


abstract class FavpageState extends Equatable{
      const FavpageState();

  @override
  List<Object> get props => [];
}

class FavpageInitial extends FavpageState {}


class FavpageSuccess extends FavpageState {
    final List<Map<String,dynamic>> myFav;


  FavpageSuccess({this.myFav});

  @override
  List<Object> get props => [myFav];
}

class FavpageLoading extends FavpageState {}

class FavpageError extends FavpageState {}
class FavpageVacio extends FavpageState {}
