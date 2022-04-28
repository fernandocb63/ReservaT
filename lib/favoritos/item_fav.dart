import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reserva_t/favoritos/delete/bloc/deleteitem_bloc.dart';
import 'package:reserva_t/restaurante/un_restaurante.dart';
import 'package:reserva_t/usuario/blocfavusr/favpage_bloc.dart';

class ItemFav extends StatefulWidget {
  final Map<String, dynamic> myData;
  final Map<String, dynamic> idd;
  ItemFav({Key key, this.myData, this.idd}) : super(key: key);

  @override
  State<ItemFav> createState() => _ItemFavState();
}

class _ItemFavState extends State<ItemFav> {
  bool _switchValue = false;

  @override
  void initState() {
    // TODO: implement initState
    _switchValue = widget.myData["public"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteitemBloc, DeleteitemState>(
      listener: (context, state) {
        if(state is DeleteSuccess){
          BlocProvider.of<FavpageBloc>(context).add(GetMyFavorites());
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListTile(
            leading: IconButton(
                onPressed: () {
                  BlocProvider.of<DeleteitemBloc>(context)
                      .add(DeleteMyFav(deleteid: widget.myData["id"]));
                },
                icon: Icon(Icons.cancel)),
            title: Text("${widget.myData["Nombre"]}"),
            subtitle: Text("${widget.myData["Descripcion"]}"),
            trailing: IconButton(
              iconSize: 40,
              icon: Icon(Icons.arrow_right),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Un_restaurante(
                          nombre: widget.myData["Nombre"].toString(),
                          descripcion: widget.myData["Descripcion"].toString(),
                          foto: widget.myData["Foto"].toString(),
                          latitude: widget.myData["Latitude"].toString(),
                          longitud: widget.myData["Longitud"].toString(),
                          menu: widget.myData["Menu"].toString(),
                          logo: widget.myData["Logo"].toString(),
                          //id: widget.docid
                        )));
              },
            ),
          ),
        );
      },
    );
  }
}
