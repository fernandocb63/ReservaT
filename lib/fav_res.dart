import 'package:flutter/material.dart';
import 'package:reserva_t/un_restaurante.dart';

class Fav_res extends StatefulWidget {
  Fav_res({Key key}) : super(key: key);

  @override
  State<Fav_res> createState() => _Fav_resState();
}

class _Fav_resState extends State<Fav_res> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurantes favoritos'),
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
