import 'package:flutter/material.dart';
import 'package:reserva_t/auth/bloc/auth_bloc.dart';
import 'package:reserva_t/favoritos/bloc/addfav_bloc.dart';
import 'package:reserva_t/favoritos/bloc/favpage_bloc.dart';
import 'package:reserva_t/favoritos/delete/bloc/deleteitem_bloc.dart';
import 'package:reserva_t/favoritos/fav_page.dart';
import 'package:reserva_t/historial/bloc/addhistorial_bloc.dart';
import 'package:reserva_t/historial/bloc/historialpage_bloc.dart';
import 'package:reserva_t/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:reserva_t/login/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reserva_t/usuario/bloc/getuserinfo_bloc.dart';

void main() async {
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
        BlocProvider(
          create: (context) => AddfavBloc(),
        ),
        BlocProvider(
          create: (context) => DeleteitemBloc(),
        ),
        BlocProvider(
          create: (context) => GetUserInfoBloc(),
        ),
        BlocProvider(
          create: (context) => AddhistorialBloc(),
        ),
        BlocProvider(
          create: (context) => HistorialpageBloc()..add(GetMyHistorial()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.grey),
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
            BlocProvider.of<GetUserInfoBloc>(context).add(GetInfo());
            return HomePage();
          } else if (state is UnAuthState ||
              state is AuthErrorState ||
              state is SignOutSuccessState) {
            return LoginPage();
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
