import 'package:flutter/material.dart';
import 'package:initium/gradient_back.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(
            height: null,
          ),
          Column(
            children: [
              AppBar(
                elevation: 0,
                backgroundColor: Colors.black,
                title: Icon(Icons.all_inclusive, color: Colors.black),
                centerTitle: true,
                actions: <Widget>[
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.amberAccent[700],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
