import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:initium/User/bloc/bloc_user.dart';
import 'package:initium/User/ui/screens/tutorial_screen.dart';
import 'package:initium/User/ui/widgets/button_bar.dart';
import 'package:initium/User/ui/widgets/profile_header.dart';
import 'package:initium/button.dart';
import 'package:initium/gradient_back.dart';
import 'package:linear_gradient/linear_gradient.dart';

class UserAccountScreen extends StatefulWidget {
  @override
  _UserAccountScreen createState() => _UserAccountScreen();
}

class _UserAccountScreen extends State<UserAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
        bloc: UserBloc(),
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradientStyle.linearGradient(
              orientation: LinearGradientStyle.ORIENTATION_HORIZONTAL,
              gradientType: LinearGradientStyle.GRADIENT_TYPE_MIDNIGHT_CITY,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 30.0,
                ),
                ProfileHeader(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 570.0,
                ),
                ButtonsBar(),
              ],
            ),
          ),
        ));
  }
}
