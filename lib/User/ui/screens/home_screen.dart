import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:initium/User/bloc/bloc_user.dart';
import 'package:initium/button.dart';
import 'package:initium/gradient_back.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of(context);
    return Scaffold(
      body: Stack(
        children: [
          GradientBack("Home", null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                text: "Cerrar sesión",
                heigth: 50.0,
                width: 300.0,
                onPressed: () {
                  userBloc.signOut();
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
