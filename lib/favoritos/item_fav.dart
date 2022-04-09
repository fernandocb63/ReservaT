import 'package:flutter/material.dart';
import 'package:reserva_t/restaurante/un_restaurante.dart';

class ItemFav extends StatefulWidget {
  final Map<String, dynamic> myData;
  ItemFav({Key key,  this.myData}) : super(key: key);

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
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListTile(
                    leading: Icon(Icons.place),
                    title: Text("${widget.myData["Nombre"]}"),
                    subtitle: Text("${widget.myData["Descripcion"]}"),
                    trailing: IconButton(
                      iconSize: 40,
                      icon: Icon(Icons.arrow_right),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Un_restaurante()));
                      },
                    ),
                  ),
    );

  }
}