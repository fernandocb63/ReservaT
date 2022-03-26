import 'package:flutter/material.dart';

class Historial extends StatefulWidget {
  Historial({Key key}) : super(key: key);

  @override
  State<Historial> createState() => _HistorialState();
}

class _HistorialState extends State<Historial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial de restaurantes'),
      ),
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
                  title: Text('Restaurante'),
                  subtitle: Text('Descirpcion de restaurante'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
