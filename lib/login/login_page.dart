import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reserva_t/auth/bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/loginbg.gif'),
            fit: BoxFit.cover
            )

        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 480, 0, 10),
              child: Column(
                children: [
                  // Image.network("https://im.ezgif.com/tmp/ezgif-1-98d8229409.gif",
                  // fit: ,),
                  Image.asset('assets/text.gif'),
                  // Text("Reserva-T",
                  // style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic, color: Colors.black)),
                  SizedBox(height: 25,),

                  MaterialButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(GoogleAuthEvent());
                    },
                    color: Colors.teal.shade200,
                    child: Text("Login con Google",
                    style: TextStyle(color: Colors.black)),
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}