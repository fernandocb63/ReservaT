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
      this.id})
      : super(key: key);
  String nombre;
  String descripcion;
  String foto;
  String menu;
  String latitude;
  String longitud;
  String logo;
  String id;

  @override
  State<Un_restaurante> createState() => _Un_restauranteState();
}

class _Un_restauranteState extends State<Un_restaurante> {
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
                  child: Image.network(
                    widget.foto,
                    height: 300,
                  ),
                ),
                Text(widget.nombre,
                    style:
                        TextStyle(fontSize: 40, fontStyle: FontStyle.italic)),
                Card(
                  color: Colors.white60,
                  child: ListTile(
                    title: Text(
                      'Ver menu',
                      style:
                          TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                    ),
                    trailing: IconButton(
                      iconSize: 40,
                      icon: Icon(Icons.menu_book),
                      onPressed: () {
                        launch(widget.menu);
                      },
                    ),
                  ),
                ),
                Card(
                  color: Colors.white60,
                  child: ListTile(
                    title: Text(
                      'Hacer reservacion',
                      style:
                          TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                    ),
                    trailing: IconButton(
                      iconSize: 40,
                      icon: Icon(Icons.perm_contact_cal_outlined),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Reservacion()));
                      },
                    ),
                  ),
                ),
                Card(
                  color: Colors.white60,
                  child: ListTile(
                    title: Text(
                      'Mapa',
                      style:
                          TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                    ),
                    trailing: IconButton(
                      iconSize: 40,
                      icon: Icon(Icons.map),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                                create: (context) => MapaProvider(),
                                child: Mapa())));
                      },
                    ),
                  ),
                ),
                Card(
                  color: Colors.white60,
                  child: ListTile(
                    title: Text(
                      'Agregar a favoritos',
                      style:
                          TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                    ),
                    trailing: IconButton(
                      iconSize: 40,
                      icon: Icon(Icons.favorite),
                      onPressed: () {
                        BlocProvider.of<AddfavBloc>(context)
                            .add(addFavorite(id: widget.id));
                      },
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
