import 'package:flutter/material.dart';

class un_restaurante extends StatefulWidget {
  un_restaurante({Key? key}) : super(key: key);

  @override
  State<un_restaurante> createState() => _un_restauranteState();
}

class _un_restauranteState extends State<un_restaurante> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nombre restaurante'),
        ),
        body: Column(children: [
          Center(
            child: Image(
              image: 
                NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                height: 300,
            ),
          ),

          Text('nombre res',
            style: 
              TextStyle(fontSize: 40,fontStyle: FontStyle.italic)),

          Card(
            color: Colors.white60,
            child: ListTile(
              
              title: Text('Ver menu',style: 
                TextStyle(fontSize: 30,fontStyle: FontStyle.italic),),
              trailing: IconButton(iconSize: 40, icon: Icon(Icons.menu_book), onPressed: () {
                            },),
                    ),
          ),
          Card(
            color: Colors.white60,
            child: ListTile(
              
              title: Text('Hacer reservacion',style: 
                TextStyle(fontSize: 30,fontStyle: FontStyle.italic),),
              trailing: IconButton(iconSize: 40, icon: Icon(Icons.perm_contact_cal_outlined), onPressed: () {
                            },),
                    ),
          ),
          Card(
            color: Colors.white60,
            child: ListTile(
              
              title: Text('Mapa',style: 
                TextStyle(fontSize: 30,fontStyle: FontStyle.italic),),
              trailing: IconButton(iconSize: 40, icon: Icon(Icons.map), onPressed: () {
                            },),
                    ),
          ),
          Card(
            color: Colors.white60,
            child: ListTile(
              
              title: Text('Mensajes',style: 
                TextStyle(fontSize: 30,fontStyle: FontStyle.italic),),
              trailing: IconButton(iconSize: 40, icon: Icon(Icons.message), onPressed: () {
                            },),
                    ),
          ),
        ],)
      );
  }
}