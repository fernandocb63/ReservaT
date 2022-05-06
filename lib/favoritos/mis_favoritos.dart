import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reserva_t/favoritos/bloc/favpage_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:reserva_t/favoritos/item_fav.dart';

class MisFavoritos extends StatefulWidget {
  const MisFavoritos({Key key}) : super(key: key);

  @override
  State<MisFavoritos> createState() => _MisFavoritosState();
}

class _MisFavoritosState extends State<MisFavoritos> {
  @override
  Widget build(BuildContext context) {

  TextEditingController textController = TextEditingController();
    String txt ='V';
    List< dynamic> dataOriginal;
    List< dynamic> dataCopia;
    // List< dynamic> Temporal;


    return Stack(
      children:[  
        // Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: TextField(
        //       onChanged: (val){
        //         txt = val;
        //         BlocProvider.of<FavpageBloc>(context).add(GetMyFavorites());               
        //       },
        //       decoration: InputDecoration(border: OutlineInputBorder(), 
        //       hintText: "Ingresa tu busqueda",
        //       prefixIcon: Icon(Icons.search),
        //       suffixIcon: Icon(Icons.navigate_next_outlined))),
        // ),
        
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: BlocConsumer<FavpageBloc, FavpageState>(
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
              BlocProvider.of<FavpageBloc>(context).add(GetMyFavorites());
              dataOriginal = state.myFav;
              dataCopia = state.myFav;
              void getsearch(String query){
                if(query.isNotEmpty){
                  List<dynamic> _tempList = dataCopia.where((element) => element["Nombre"].contains('Vaca')).toList();
                  dataOriginal = _tempList;
                  print('1');
                  print('1');
                  print('1');
                  print('1');
                  print('1');
                  print('1');
                  print('1');
                  print('1');
                  print('1');
                  print('1');
                  print('1');
                  print('1');
                  print(dataOriginal);
                  setState(() {

                  });
                } else {
                  dataOriginal = dataCopia;
                  setState(() {

                  });
                }
              }





              return 
              Stack(
                children:[ 
                  // Padding(
                  //     padding: const EdgeInsets.all(10.0),
                  //     child: TextField(
                  //         controller: textController,
                  //         onChanged: (val){
                  //           getsearch(val);
                  //           setState(() {});              
                  //         },
                  //         decoration: InputDecoration(border: OutlineInputBorder(), 
                  //         hintText: "Ingresa tu busqueda",
                  //         prefixIcon: Icon(Icons.search),
                  //         suffixIcon: Icon(Icons.navigate_next_outlined))),
                  //   ),
                  
                  
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: 
                    
                    
                    
                    ListView.builder(
                    itemCount: dataOriginal.length,
                    itemBuilder: (BuildContext context, int index){
                      return ItemFav(myData: dataOriginal[index]);
                      // return state.myFav[index]['Nombre']?ItemFav(myData: state.myFav[index]):Text('-');
                    }),



                  ),
                  
                  ]
              );
            }else {
              return Center(child: CircularProgressIndicator());
            }
          },
      ),
        ),
      ]
    );
  }
}