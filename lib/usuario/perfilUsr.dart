import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reserva_t/favoritos/fav_page.dart';
import 'package:reserva_t/favoritos/mis_favoritos.dart';
import 'package:reserva_t/restaurante/getRestaurante.dart';
import 'package:reserva_t/usuario/bloc/getuserinfo_bloc.dart';
import 'package:reserva_t/usuario/blocfavusr/favpage_bloc.dart';
import 'package:reserva_t/usuario/descripcion_user.dart';
import 'package:reserva_t/usuario/fav_res.dart';
import 'package:reserva_t/usuario/historial.dart';

class perfil_usuario extends StatefulWidget {
  perfil_usuario({Key key}) : super(key: key);

  @override
  State<perfil_usuario> createState() => _perfil_usuarioState();
}

class _perfil_usuarioState extends State<perfil_usuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<GetUserInfoBloc, GetUserInfoState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetUserInfoSuccess) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(state.mapa['image']),
                  minRadius: 100,
                  maxRadius: 100,
                ),
              ),
              Text(state.mapa['nombre'],
                  style: TextStyle(fontSize: 40, fontStyle: FontStyle.italic)),
              Card(
                color: Colors.white60,
                child: ListTile(
                  title: Text(
                    'Descripcion',
                    style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                  ),
                  leading: IconButton(
                    iconSize: 40,
                    icon: Icon(Icons.book),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Descripcion_user()));
                    },
                  ),
                ),
              ),
              Card(
                color: Colors.white60,
                child: ListTile(
                  title: Text(
                    'Restaurantes fav',
                    style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                  ),
                  leading: IconButton(
                    iconSize: 30,
                    icon: Icon(Icons.favorite),
                    onPressed: () {
                      //BlocProvider.of<FavpageBloc>(context).add(GetMyFavorites());
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MisFavoritos()));
                    },
                  ),
                ),
              ),
              Card(
                color: Colors.white60,
                child: ListTile(
                  title: Text(
                    'Historial',
                    style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                  ),
                  leading: IconButton(
                    iconSize: 30,
                    icon: Icon(Icons.history),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Historial()));
                    },
                  ),
                ),
              ),
            ],
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 122, 113, 113),
                  minRadius: 40,
                  maxRadius: 120,
                ),
              ),
              Text('',
                  style: TextStyle(fontSize: 40, fontStyle: FontStyle.italic)),
              Card(
                color: Colors.white60,
                child: ListTile(
                  title: Text(
                    'Descripcion',
                    style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                  ),
                  leading: IconButton(
                    iconSize: 40,
                    icon: Icon(Icons.book),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Descripcion_user()));
                    },
                  ),
                ),
              ),
              Card(
                color: Colors.white60,
                child: ListTile(
                  title: Text(
                    'Restaurantes fav',
                    style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                  ),
                  leading: IconButton(
                    iconSize: 30,
                    icon: Icon(Icons.favorite),
                    onPressed: () {
                      //BlocProvider.of<FavpageBloc>(context).add(GetMyFavorites());
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MisFavoritos()));
                    },
                  ),
                ),
              ),
              Card(
                color: Colors.white60,
                child: ListTile(
                  title: Text(
                    'Historial',
                    style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                  ),
                  leading: IconButton(
                    iconSize: 30,
                    icon: Icon(Icons.history),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Historial()));
                    },
                  ),
                ),
              ),
            ],
          );
        }
      },
    ));
  }
}
