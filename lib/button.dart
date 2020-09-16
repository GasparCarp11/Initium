import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  double width = 0.0;
  double heigth = 0.0;

  Button(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.heigth,
      this.width});

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        height: widget.heigth,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
                colors: [Colors.yellow[600], Colors.amberAccent[700]],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
                fontSize: 18.0,
                fontFamily: "Montserrat",
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
