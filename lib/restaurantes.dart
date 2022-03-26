import 'package:flutter/material.dart';

class Resturantes extends StatefulWidget {
  Resturantes({Key? key}) : super(key: key);

  @override
  State<Resturantes> createState() => _ResturantesState();
}

class _ResturantesState extends State<Resturantes> {
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
              ),),
        ],
      )
    );
  }
}