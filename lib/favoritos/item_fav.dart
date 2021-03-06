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
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Un_restaurante(
                              nombre: widget.myData["Nombre"].toString(),
                              descripcion: widget.myData["Descripcion"].toString(),
                              foto: widget.myData["Foto"].toString(),
                              latitude: widget.myData["Latitud"].toString(),
                              longitud: widget.myData["Longitud"].toString(),
                              menu: widget.myData["Menu"].toString(),
                              logo: widget.myData["Logo"].toString(),
                              mail: widget.myData["mail"].toString(),
                              tel: widget.myData["tel"].toString(),
                              //id: widget.docid
                              

                            )));
            },
            child: ListTile(
              leading: Image.network(
                      widget.myData["Foto"].toString(),
                      height: 300,
                    ),
              title: Stack(children:[ 
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text("${widget.myData["Nombre"]}"),
                ),
              ],
              ),
              subtitle: Stack( children:[ Text("${widget.myData["Descripcion"]}"),
              ]
              ),
              trailing: Stack(
                children:[ Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: IconButton(
                  onPressed: () {
                    eliminarFav(context);
                  },
                  icon: Icon(Icons.cancel),
                  iconSize: 25,
                  
                  )
                ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
    eliminarFav(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text(
        "Cancelar",
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        "OK",
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      onPressed: () async {
        Navigator.of(context).pop();
         BlocProvider.of<DeleteitemBloc>(context)
                        .add(DeleteMyFav(deleteid: widget.myData["id"]));
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Eliminar"),
      content: Text("??Quieres eliminar ${widget.myData["Nombre"]} de favoritos?"),
      actions: [cancelButton, continueButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
