import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:reserva_t/favoritos/bloc/addfav_bloc.dart';
import 'package:reserva_t/google_maps/mapa.dart';
import 'package:reserva_t/google_maps/mapa_provider.dart';
import 'package:reserva_t/home_page.dart';
import 'package:reserva_t/restaurante/menu.dart';
import 'package:reserva_t/restaurante/reservacion.dart';
import 'package:reserva_t/usuario/blocfavusr/favpage_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import "package:hovering/hovering.dart";
import 'package:hover_effect/hover_effect.dart';

class Un_restaurante extends StatefulWidget {
  Un_restaurante(
      {Key key,
      this.nombre,
      this.descripcion,
      this.foto,
      this.menu,
      this.latitude,
      this.longitud,
      this.logo,
      this.id,
      this.mail})
      : super(key: key);
  String nombre;
  String descripcion;
  String foto;
  String menu;
  String latitude;
  String longitud;
  String logo;
  String id;
  String mail;

  @override
  State<Un_restaurante> createState() => _Un_restauranteState();
}

class _Un_restauranteState extends State<Un_restaurante> {
  double h = 50;
  double l = 22;
  double i = 25;
  int _phoneNumber = 3481460986;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddfavBloc, AddfavState>(
      listener: (context, state) {
        if (state is AddfavSucces) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Se agrego ${widget.nombre} a favoritos...")));
        } else if (state is AddfavError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("${widget.nombre} ya existe en favoritos...")));
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Restaurante'),
            ),
            body: Column(
              
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                    backgroundImage: NetworkImage(widget.foto),
                    minRadius: 140,
                    maxRadius: 140,
                ),
                  )
                ),
                Text(widget.nombre,
                    style:
                        TextStyle(fontSize: 40, fontStyle: FontStyle.italic)),
                Container(
                  height: h,
                  child: Card(
                    semanticContainer: true,
                    color: Colors.blueGrey.shade900,
                    elevation: 100.0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,0),
                      child: ListTile(
                        title: Text(
                          'Ver menu',
                          style:
                              TextStyle(fontSize: l, fontStyle: FontStyle.italic),
                        ),
                        trailing: IconButton(
                          iconSize: i,
                          icon: Icon(Icons.menu_book),
                          onPressed: () {
                            launch(widget.menu);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: h,
                  child: Card(
                    color: Colors.blueGrey.shade900,
                    elevation: 100.0,
                    child: ListTile(
                      title: Text(
                        'Hacer reservacion',
                        style:
                            TextStyle(fontSize: l, fontStyle: FontStyle.italic),
                      ),
                      trailing: IconButton(
                        iconSize: i,
                        icon: Icon(Icons.perm_contact_cal_outlined),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BookingCalendarDemoApp(
                                  mail: widget.mail,
                                  res: widget.nombre,
                                  foto: widget.foto)));
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  height: h,
                  child: Card(
                    color: Colors.blueGrey.shade900,
                    elevation: 100.0,
                    child: ListTile(
                      title: Text(
                        'Mapa',
                        style:
                            TextStyle(fontSize: l, fontStyle: FontStyle.italic),
                      ),
                      trailing: IconButton(
                        iconSize: i,
                        icon: Icon(Icons.map),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                  create: (context) => MapaProvider(),
                                  child: Mapa(
                                    lat: widget.latitude,
                                    long: widget.longitud,
                                    nombre: widget.nombre,
                                  ))));
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  height: h,
                  child: Card(
                    color: Colors.blueGrey.shade900,
                    elevation: 100.0,
                    shadowColor: Colors.white60,
                    child: ListTile(
                      title: Text(
                        'Agregar a favoritos',
                        style:
                            TextStyle(fontSize: l, fontStyle: FontStyle.italic),
                      ),
                      trailing: IconButton(
                        iconSize: i,
                        icon: Icon(Icons.favorite),
                        onPressed: () {
                          BlocProvider.of<AddfavBloc>(context)
                              .add(addFavorite(id: widget.id));
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  height: h,
                  alignment: Alignment.center,
                  child: Card(
                    color: Colors.blueGrey.shade900,
                    elevation: 100.0,
                    shadowColor: Colors.white60,
                    child: ListTile(
                      title: Text(
                        'Llamar',
                        style:
                            TextStyle(fontSize: l, fontStyle: FontStyle.italic),
                            textAlign: TextAlign.start,
                      ),
                      trailing: IconButton(
                        iconSize: i,
                        icon: Icon(Icons.phone),
                        onPressed: () {
                          launch('tel://$_phoneNumber');
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
