import 'package:flutter/material.dart';

class Descripcion_user extends StatefulWidget {
  Descripcion_user({Key key}) : super(key: key);

  @override
  State<Descripcion_user> createState() => _Descripcion_userState();
}

class _Descripcion_userState extends State<Descripcion_user> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Descripcion'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Text('Descripcion de ususario'),
            SizedBox(
              height: 15,
            ),
            Text('Ajúa'),
          ],
        ),
      ),
    );
  }
}
