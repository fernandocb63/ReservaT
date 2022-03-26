import 'package:flutter/material.dart';
import 'package:reserva_t/chat.dart';

class Mensajes extends StatefulWidget {
  Mensajes({Key key}) : super(key: key);

  @override
  State<Mensajes> createState() => _MensajesState();
}

class _MensajesState extends State<Mensajes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Search",
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: FlutterLogo(size: 56.0),
                  title: Text('Nombre de restaurante'),
                  subtitle: Text('Ultimo mensaje de conversación'),
                  trailing: IconButton(
                    iconSize: 40,
                    icon: Icon(Icons.arrow_right_alt_rounded),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Chat()));
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
