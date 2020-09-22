import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:initium/User/bloc/bloc_user.dart';
import 'package:initium/User/model/usuario.dart';
import 'package:initium/User/ui/widgets/user_info.dart';
import 'package:linear_gradient/linear_gradient.dart';
import 'button_bar.dart';

class ProfileHeader extends StatelessWidget {
  UserBloc userBloc;
  Usuario user;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return StreamBuilder(
        stream: userBloc.streamFirebase,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container();
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Container();
              case ConnectionState.active:
              case ConnectionState.done:
                return showProfileData(snapshot, context);
            }
          }
        });
  }

  Widget showProfileData(AsyncSnapshot snapshot, BuildContext context) {
    print("Usuario logueado");
    print(snapshot.data);

    return Container(
      width: MediaQuery.of(context).size.width - 15,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 15.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(snapshot.data.photoURL),
              radius: 20.0,
            ),
          ),
          Text(
            snapshot.data.displayName,
            style: TextStyle(
                fontSize: 18.0,
                fontFamily: "Montserrat",
                color: Colors.amberAccent[700],
                fontWeight: FontWeight.w500),
          ),
          Container(
            margin: EdgeInsets.only(right: 15.0),
            child: IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.amberAccent[700],
                ),
                onPressed: () {
                  userBloc.signOut();
                }),
          )
        ],
      ),
    );
  }
}
