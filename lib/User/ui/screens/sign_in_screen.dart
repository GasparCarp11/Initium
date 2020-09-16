import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:initium/User/bloc/bloc_user.dart';
import 'package:initium/User/ui/screens/home_screen.dart';
import 'package:initium/button.dart';

import '../../../gradient_back.dart';

class SignInScreen extends StatefulWidget {
  @override
  State createState() {
    return _SignInScreenState();
  }
}

class _SignInScreenState extends State<SignInScreen> {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError || snapshot.data == null) {
            return signInGoogleUI();
          } else {
            return HomeScreen();
          }
        });
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack("", null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bienvenido.\nA tu aplicacion de pedidos",
                style: TextStyle(
                  fontSize: 28.0,
                  fontFamily: "Montserrat",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              Button(
                text: "Inicia con Google",
                onPressed: () {
                  userBloc.signIn().then((UserCredential user) =>
                      print("El usuario es ${user.user.displayName}"));
                },
                heigth: 50.0,
                width: 300.0,
              )
            ],
          )
        ],
      ),
    );
  }
}
