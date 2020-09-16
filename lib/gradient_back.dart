import 'package:flutter/material.dart';
import 'package:linear_gradient/linear_gradient.dart';

class GradientBack extends StatelessWidget {
  String title = "Popular";
  double height = 0.0;

  GradientBack(this.title, this.height);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: height,
      decoration: BoxDecoration(
          gradient: LinearGradientStyle.linearGradient(
        orientation: LinearGradientStyle.ORIENTATION_HORIZONTAL,
        gradientType: LinearGradientStyle.GRADIENT_TYPE_MIDNIGHT_CITY,
      )),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: "Lato",
            fontWeight: FontWeight.w800),
      ),
      alignment: Alignment(-0.9, -0.6),
    );
  }
}
