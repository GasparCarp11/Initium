import 'package:flutter/material.dart';
import 'package:linear_gradient/linear_gradient.dart';

class GradientBack extends StatelessWidget {
  String title = "Popular";
  double height = 0.0;

  GradientBack({Key key, this.height});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;

    if (height == null) {
      height = screenHeight;
    }

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradientStyle.linearGradient(
        orientation: LinearGradientStyle.ORIENTATION_HORIZONTAL,
        gradientType: LinearGradientStyle.GRADIENT_TYPE_DARK_OCEAN,
      )),
    );
  }
}
