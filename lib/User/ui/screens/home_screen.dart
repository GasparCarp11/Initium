import 'package:flutter/material.dart';
import 'package:initium/gradient_back.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GradientBack("Home", null),
          Column(
            children: [Text("Home")],
          )
        ],
      ),
    );
  }
}
