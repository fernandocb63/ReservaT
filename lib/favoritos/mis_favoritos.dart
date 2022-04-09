import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reserva_t/favoritos/bloc/favpage_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:reserva_t/favoritos/item_fav.dart';

class MisFavoritos extends StatelessWidget {
  const MisFavoritos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavpageBloc, FavpageState>(
      listener: (context, state) {
        //Show snackbar
      },
      builder: (context, state) {
        if(state is FavpageLoading){
          return ListView.builder(
            itemCount: 25,
            itemBuilder: (BuildContext context, int index){
              return YoutubeShimmer();
            },
          );
        } else if(state is FavpageVacio){
          return Center(
            child: Text("No hay datos por mostrar"),
          );
        } else if (state is FavpageSuccess){
          return ListView.builder(
            itemCount: state.myFav.length,
            itemBuilder: (BuildContext context, int index){
              return ItemFav(myData: state.myFav[index]);
            });
        }else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}