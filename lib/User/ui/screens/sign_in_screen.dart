import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:initium/User/bloc/bloc_user.dart';
import 'package:initium/User/model/usuario.dart';
import 'package:initium/User/ui/widgets/tools.widgets/button.dart';
import 'package:initium/gradient_back.dart';
import 'account_user_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  State createState() {
    return _SignInScreenState();
  }
}

class _SignInScreenState extends State<SignInScreen> {
  UserBloc userBloc;
  double screenwidth;

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
            return AccountUserScreen();
          }
        });
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  width: screenwidth,
                  child: Container(
                    margin: EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: [
                        Text(
                          "Bienvenido\nA Initium.",
                          style: TextStyle(
                            fontSize: 28.0,
                            fontFamily: "Montserrat",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Image(
                          image: AssetImage('assets/initium.png'),
                          height: 80,
                          width: 150,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Button(
                assetphoto: "assets/google.png",
                text: "Inicia con Google",
                onPressed: () {
                  userBloc.signOut();
                  userBloc.signIn().then((UserCredential user) =>
                      userBloc.updateUserData(Usuario(
                          uid: user.user.uid,
                          name: user.user.displayName,
                          email: user.user.email,
                          photoURL: user.user.photoURL)));
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
