import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;
  final _pagesList=[
    Center(child: Text("Restaurantes")),
    Center(child: Text("Favoritos")),
    Center(child: Text("Mensajes")),
    Center(child: Text("Mi perfil")),
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
        body: Column(
          children: [
            IndexedStack(index: _currentPageIndex,
            children: _pagesList),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Search",
                  prefixIcon: Icon(Icons.search)
                ),
              ),
            ),
            Expanded(
          child: 
          ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                    leading: FlutterLogo(size: 56.0),
                    title: Text('Restaurante X'),
                    subtitle: Text('Descirpcion res'),
                    trailing: IconButton(iconSize: 40, icon: Icon(Icons.arrow_right), onPressed: () {  },),
              );
            },
          ),)
          ],
        ),
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
            ),
            BottomNavigationBarItem(
              label: _pagesNameList[1],
              icon: Icon(Icons.favorite)
            ),
            BottomNavigationBarItem(
              label: _pagesNameList[2],
              icon: Icon(Icons.message),
            ),
            BottomNavigationBarItem(
              label: _pagesNameList[3],
              icon: Icon(Icons.portrait_rounded),
            ),
          ],
        ),
      );
  }
}