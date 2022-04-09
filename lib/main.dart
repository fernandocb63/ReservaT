import 'package:flutter/material.dart';
import 'package:reserva_t/auth/bloc/auth_bloc.dart';
import 'package:reserva_t/favoritos/bloc/favpage_bloc.dart';
import 'package:reserva_t/favoritos/fav_page.dart';
import 'package:reserva_t/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:reserva_t/login/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
runApp(
  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(VerifyAuthEvent()),
        ),
        BlocProvider(
          create: (context) => FavpageBloc()..add(GetMyFavorites()),
        ),
      ],
      child: MyApp(),
    ),


); }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
        ),
      ),
      home: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Favor de autenticarse"),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthSuccessState) {
            return HomePage();
          } else if (state is UnAuthState || state is AuthErrorState) {
            return LoginPage();
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}