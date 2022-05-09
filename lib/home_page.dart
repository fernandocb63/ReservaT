import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reserva_t/auth/bloc/auth_bloc.dart';
import 'package:reserva_t/favoritos/bloc/favpage_bloc.dart';
import 'package:reserva_t/favoritos/mis_favoritos.dart';
import 'package:reserva_t/favoritos/fav_page.dart';
import 'package:reserva_t/restaurante/restaurantes.dart';
import 'package:reserva_t/usuario/perfilUsr.dart';
import 'package:reserva_t/restaurante/getRestaurante.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;
  final _pagesList = [
    ResU(),
    MisFavoritos(),
    perfil_usuario(),
  ];

  final _pagesNameList = [
    "Restaurantes",
    "Favoritos",
    "Mi perfil",
  ];
  @override
  Widget build(BuildContext context) {
    String txt = '';
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva[T]'),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: _pagesList[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        currentIndex: _currentPageIndex,
        onTap: (index) {
          BlocProvider.of<FavpageBloc>(context).add(GetMyFavorites(text: txt));
          setState(() {
            _currentPageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              label: _pagesNameList[0],
              icon: Icon(Icons.view_carousel),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              label: _pagesNameList[1],
              icon: Icon(Icons.favorite),
              backgroundColor: Colors.red,
              ),
          BottomNavigationBarItem(
              label: _pagesNameList[2],
              icon: Icon(Icons.portrait_rounded),
              backgroundColor: Colors.green),
        ],
      ),
    );
  }
}
