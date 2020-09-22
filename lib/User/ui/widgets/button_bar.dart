import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:initium/User/bloc/bloc_user.dart';
import 'package:initium/User/ui/screens/tutorial_screen.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        width: MediaQuery.of(context).size.width - 15,
        decoration: BoxDecoration(
          color: Colors.amberAccent[700],
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          children: <Widget>[
            CircleButton(
              () => {Navigator.pushNamed(context, 'user_account')},
              true,
              Icons.person,
              20.0,
            ),
            CircleButton(
              () => {},
              true,
              Icons.description,
              20.0,
            ),
            CircleButton(
              () => {Navigator.pushNamed(context, 'home')},
              true,
              Icons.home,
              20.0,
            ),
            CircleButton(
              () => {Navigator.pushNamed(context, 'tutorial')},
              true,
              Icons.help,
              20.0,
            ),
          ],
        ));
  }
}
