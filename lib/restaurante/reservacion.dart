import 'package:flutter/material.dart';

class Reservacion extends StatefulWidget {
  Reservacion({Key key}) : super(key: key);

  @override
  State<Reservacion> createState() => _ReservacionState();
}

class _ReservacionState extends State<Reservacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservación'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Text('Reservacion'),
            SizedBox(
              height: 15,
            ),
            Text('de restaurante'),
          ],
        ),
      ),
    );
  }
}
