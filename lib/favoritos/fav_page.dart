import 'package:flutter/material.dart';
import 'package:reserva_t/restaurante/un_restaurante.dart';

class FavPage extends StatefulWidget {
  FavPage({Key key}) : super(key: key);

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
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
                  title: Text('Restaurante Fav'),
                  subtitle: Text('Descirpcion res'),
                  trailing: IconButton(
                    iconSize: 40,
                    icon: Icon(Icons.arrow_right),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Un_restaurante()));
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
