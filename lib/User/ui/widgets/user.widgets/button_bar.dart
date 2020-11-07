import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../../../bloc/bloc_user.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            CircleButton(() {}, true, Icons.help, 20.0, Colors.white12),
            CircleButton(() {
              Navigator.pushNamed(context, "initium");
            }, false, Icons.all_inclusive, 25.0, Colors.white12),
            CircleButton(() {
              userBloc.signOut();
              Navigator.pushNamed(context, "/");
            }, true, Icons.exit_to_app, 20.0, Colors.white12)
          ],
        ));
  }
}
