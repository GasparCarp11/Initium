import 'package:flutter/material.dart';
import 'package:initium/button.dart';

class TutorialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Image(image: AssetImage("assets/Screen1.PNG")),
              Image(image: AssetImage("assets/Screen2.PNG")),
              Image(image: AssetImage("assets/Screen3.PNG")),
            ],
          ),
          GoogleButton(
              heigth: 75.0,
              width: 250.0,
              text: "Volver a mi cuenta",
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
