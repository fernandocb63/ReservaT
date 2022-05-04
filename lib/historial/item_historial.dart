import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reserva_t/historial/bloc/eliminarres_bloc.dart';
import 'package:reserva_t/historial/bloc/historialpage_bloc.dart';
import 'package:reserva_t/historial/mi_historial.dart';

class ItemHistorial extends StatefulWidget {
  ItemHistorial({Key key, this.myHis}) : super(key: key);
  final Map<String, dynamic> myHis;

  @override
  State<ItemHistorial> createState() => _ItemHistorialState();
}

class _ItemHistorialState extends State<ItemHistorial> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime get = DateTime.parse(widget.myHis["fecha"]);
    return BlocConsumer<EliminarresBloc, EliminarresState>(
      listener: (context, state) {
        if(state is EliminarresSuccess){
          setState(() {
          BlocProvider.of<HistorialpageBloc>(context).add(GetMyHistorial());

          });
          
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: ListTile(
            leading: Image.network(
              widget.myHis["foto"].toString(),
              height: 300,
            ),
            title: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text("${widget.myHis["nombre"]}"),
                ),
              ],
            ),
            subtitle: Stack(children: [
              Text("Fecha de reservacion: ${widget.myHis["fecha"]}"),
            ]),
            trailing: get.isAfter(now)
                ? IconButton(
                    onPressed: () {
                      cancelarReserva(context);
                    },
                    icon: Icon(Icons.cancel))
                : Text(''),
          ),
        );
      },
    );
  }

  cancelarReserva(BuildContext context) {
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
        BlocProvider.of<EliminarresBloc>(context).add(EliminarHistoriall(
            nombre: widget.myHis["nombre"],
            foto: widget.myHis["foto"],
            fecha: widget.myHis["fecha"],
            email: widget.myHis["email"]));
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Cancelar"),
      content: Text("¿Quieres cancelar la reservación?"),
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
