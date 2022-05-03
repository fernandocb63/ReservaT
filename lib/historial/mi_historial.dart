import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:reserva_t/historial/bloc/historialpage_bloc.dart';
import 'package:reserva_t/historial/item_historial.dart';

class MiHistorial extends StatefulWidget {
  MiHistorial({Key key}) : super(key: key);

  @override
  State<MiHistorial> createState() => _MiHistorialState();
}

class _MiHistorialState extends State<MiHistorial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Historial")),
      body: BlocConsumer<HistorialpageBloc, HistorialpageState>(
        listener: (context, state) {
          //Show snackbar
        },
        builder: (context, state) {
          if(state is HistorialLoading){
            return ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index){
                return YoutubeShimmer();
              },
            );
          } else if(state is HistorialVacio){
            return Center(
              child: Text("No hay datos por mostrar"),
            );
          } else if (state is HistorialSuccess){
            return ListView.builder(
              itemCount: state.myHist.length,
              itemBuilder: (BuildContext context, int index){
              return ItemHistorial(myHis: state.myHist[index]);
              });
          }else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}