import 'package:flutter/material.dart';
import 'package:reserva_t/fav_local.dart';

class perfil_usuario extends StatefulWidget {
  perfil_usuario({Key? key}) : super(key: key);

  @override
  State<perfil_usuario> createState() => _perfil_usuarioState();
}

class _perfil_usuarioState extends State<perfil_usuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Center(
            child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 122, 113, 113),
                minRadius: 40,
                maxRadius: 120,
              ),
          ),

          Text('nombre usr',
            style: 
              TextStyle(fontSize: 40,fontStyle: FontStyle.italic)),

          Card(
            color: Colors.white60,
            child: ListTile(
              
              title: Text('Descripcion',style: 
                TextStyle(fontSize: 30,fontStyle: FontStyle.italic),),
              leading: IconButton(iconSize: 40, icon: Icon(Icons.book), onPressed: () {
                            },),
                    ),
          ),
          Card(
            color: Colors.white60,
            child: ListTile(
              
              title: Text('Restaurantes fav',style: 
                TextStyle(fontSize: 30,fontStyle: FontStyle.italic),),
              leading: IconButton(iconSize: 30, icon: Icon(Icons.favorite), onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => fav_res()
                  ));         
                },),
              ),
          ),
          Card(
            color: Colors.white60,
            child: ListTile(
              
              title: Text('Historial',style: 
                TextStyle(fontSize: 30,fontStyle: FontStyle.italic),),
              leading: IconButton(iconSize: 30, icon: Icon(Icons.history), onPressed: () {
                            },),
                    ),
          ),

        ],)
      );
  }
}