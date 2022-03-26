import 'package:flutter/material.dart';
import 'package:reserva_t/fav_page.dart';
import 'package:reserva_t/restaurantes.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;
  final _pagesList=[
    Resturantes(),
    FavPage(),
    Resturantes(),
    FavPage(),
  ];

  final _pagesNameList=[
    "Restaurantes",
    "Favoritos",
    "Mensajes",
    "Mi perfil",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reserva[T]'),
        ),
        body: _pagesList[_currentPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.indigo.shade900,
          currentIndex: _currentPageIndex,
          onTap: (index) {
            setState(() {
            _currentPageIndex = index;  
            });
          },
          items: [
            BottomNavigationBarItem(
              label: _pagesNameList[0],
              icon: Icon(Icons.view_carousel),
              backgroundColor: Colors.blue
            ),
            BottomNavigationBarItem(
              label: _pagesNameList[1],
              icon: Icon(Icons.favorite),
              backgroundColor: Colors.red
            ),
            BottomNavigationBarItem(
              label: _pagesNameList[2],
              icon: Icon(Icons.message),
              backgroundColor: Colors.yellow
            ),
            BottomNavigationBarItem(
              label: _pagesNameList[3],
              icon: Icon(Icons.portrait_rounded),
              backgroundColor: Colors.green
            ),
          ],
        ),
      );
  }
}