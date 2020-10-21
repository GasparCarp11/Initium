import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../../../bloc/bloc_user.dart';
import '../../../model/usuario.dart';
import 'button_bar.dart';
import 'user_info.dart';

class ProfileHeader extends StatelessWidget {
  UserBloc _userBloc;
  Usuario _usuario;

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of(context);
    return StreamBuilder(
      stream: _userBloc.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.active:
          case ConnectionState.done:
            return showProfileData(snapshot);
        }
      },
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (snapshot.data == null || snapshot.hasError) {
      return Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
          child: Column(children: <Widget>[
            Row(
              children: <Widget>[
                CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
                  backgroundColor: Colors.blue[900],
                ),
                SizedBox(
                  width: 25.0,
                ),
                Text(
                  "No se pudo cargar la información. \nPor favor cierre la aplicacion, \ne inicie sesión nuevamente",
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 15.0,
                  ),
                ),
              ],
            )
          ]));
    } else {
      _usuario = Usuario(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL);
      final title = Text(
        'Mi cuenta',
        style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 33.0),
      );

      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[title],
            ),
            UserInfo(_usuario),
            ButtonsBar(),
          ],
        ),
      );
    }
  }
}
