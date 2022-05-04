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
        color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
              child: Column(
                children: [
                  Image.network("https://www.creativefabrica.com/wp-content/uploads/2019/08/Restaurant-Logo-by-Koko-Store-580x386.jpg"),
                  Text("Sign in", style: TextStyle(
                    fontSize: 24, 
                    fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 25,),

                  MaterialButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(GoogleAuthEvent());
                    },
                    color: Colors.red,
                    child: Text("LogIn con Google"),
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