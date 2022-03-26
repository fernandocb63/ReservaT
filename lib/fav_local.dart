import 'package:flutter/material.dart';

class fav_res extends StatefulWidget {
  fav_res({Key key}) : super(key: key);

  @override
  State<fav_res> createState() => _fav_resState();
}

class _fav_resState extends State<fav_res> {
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
                    onPressed: () {},
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
