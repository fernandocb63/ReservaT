import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Descripcion_user extends StatefulWidget {
  Descripcion_user({Key key}) : super(key: key);

  @override
  State<Descripcion_user> createState() => _Descripcion_userState();
}

class _Descripcion_userState extends State<Descripcion_user> {
  @override
  Widget build(BuildContext context) {
  var usr = FirebaseAuth.instance.currentUser;
  String correo = usr.email;
  String nombreusr = usr.displayName;
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
            
            Text('NOMBRE: ${nombreusr.toUpperCase()}',
            style: TextStyle(fontSize: 25),),
            SizedBox(
              height: 15,
            ),
            Text('CORREO: ${correo.toUpperCase()}',
            style: TextStyle(fontSize: 15)),
            SizedBox(height: 15),
            Text('Ultimo inicio de sesion: ${usr.metadata.lastSignInTime}',
            textAlign: TextAlign.justify),
          ],
        ),
      ),
    );
  }
}
