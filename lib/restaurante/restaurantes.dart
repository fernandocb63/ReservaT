import 'package:flutter/material.dart';
import 'package:reserva_t/restaurante/un_restaurante.dart';

class Resturantes extends StatefulWidget {
  final Map<String, dynamic> publicFData;
  final String docid;
  Resturantes({Key key, this.publicFData, this.docid}) : super(key: key);
  @override
    State<Resturantes> createState() => _ResturantesState();
}

class _ResturantesState extends State<Resturantes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: ListTile(
                leading: Image.network(
                    widget.publicFData["Foto"].toString(),
                    height: 300,
                  ),
                title: Text("${widget.publicFData["Nombre"].toString()}"),
                subtitle: Text("${widget.publicFData["Descripcion"].toString()}"),
                trailing: IconButton(
                  iconSize: 40,
                  icon: Icon(Icons.arrow_right),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Un_restaurante(
                          nombre: widget.publicFData["Nombre"].toString(), 
                          descripcion: widget.publicFData["Descripcion"].toString(), 
                          foto: widget.publicFData["Foto"].toString(),
                          latitude: widget.publicFData["Latitude"].toString(),
                          longitud: widget.publicFData["Longitud"].toString(),
                          menu: widget.publicFData["Menu"].toString(),
                          logo: widget.publicFData["Logo"].toString(),
                          id: widget.docid
                          )));
                  },
                ),
      ));
  }
}
