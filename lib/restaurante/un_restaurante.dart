import 'package:flutter/material.dart';
import 'package:reserva_t/restaurante/mapa.dart';
import 'package:reserva_t/restaurante/menu.dart';
import 'package:reserva_t/restaurante/reservacion.dart';

class Un_restaurante extends StatefulWidget {
  Un_restaurante({Key key}) : super(key: key);

  @override
  State<Un_restaurante> createState() => _Un_restauranteState();
}

class _Un_restauranteState extends State<Un_restaurante> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Vaca Argentina'),
        ),
        body: Column(
          children: [
            Center(
              child: Image(
                image: NetworkImage(
                    'https://fastly.4sqi.net/img/general/600x600/51791814_MIh7IEwFWS2GDuG8RTBagHYcLVjHPu-_onsmvnc3GhQ.jpg'),
                height: 300,
              ),
            ),
            Text('Vaca Argentina',
                style: TextStyle(fontSize: 40, fontStyle: FontStyle.italic)),
            Card(
              color: Colors.white60,
              child: ListTile(
                title: Text(
                  'Ver menu',
                  style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                ),
                trailing: IconButton(
                  iconSize: 40,
                  icon: Icon(Icons.menu_book),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Menu()));
                  },
                ),
              ),
            ),
            Card(
              color: Colors.white60,
              child: ListTile(
                title: Text(
                  'Hacer reservacion',
                  style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                ),
                trailing: IconButton(
                  iconSize: 40,
                  icon: Icon(Icons.perm_contact_cal_outlined),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Reservacion()));
                  },
                ),
              ),
            ),
            Card(
              color: Colors.white60,
              child: ListTile(
                title: Text(
                  'Mapa',
                  style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                ),
                trailing: IconButton(
                  iconSize: 40,
                  icon: Icon(Icons.map),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Mapa()));
                  },
                ),
              ),
            ),
            Card(
              color: Colors.white60,
              child: ListTile(
                title: Text(
                  'Agregar a favoritos',
                  style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                ),
                trailing: IconButton(
                  iconSize: 40,
                  icon: Icon(Icons.favorite),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ));
  }
}
