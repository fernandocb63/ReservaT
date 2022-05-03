import 'package:flutter/material.dart';

class ItemHistorial extends StatefulWidget {
  ItemHistorial({Key key, this.myHis}) : super(key: key);
  final Map<String, dynamic> myHis;

  @override
  State<ItemHistorial> createState() => _ItemHistorialState();
}

  

class _ItemHistorialState extends State<ItemHistorial> {


  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: ListTile(
            leading: Image.network(
                    widget.myHis["foto"].toString(),
                    height: 300,
                  ),
            title: Stack(children:[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text("${widget.myHis["nombre"]}"),
              ),
            ],
            ),
            subtitle: Stack( children:[ Text("Fecha de reservacion: ${widget.myHis["fecha"]}"),
            ]
            ),
          ),
        );
  }
}