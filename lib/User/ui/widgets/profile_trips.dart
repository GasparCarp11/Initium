import 'package:flutter/material.dart';
import 'profile_header.dart';

class ProfileTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            ProfileHeader(),
          ],
        ),
      ],
    );
  }
}
