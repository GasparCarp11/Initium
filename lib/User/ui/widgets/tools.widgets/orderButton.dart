import 'package:flutter/material.dart';

class OrderButton extends StatefulWidget {
  final VoidCallback onPressed;
  final List lproducts;

  const OrderButton(
      {Key key, @required this.onPressed, @required this.lproducts});

  @override
  State<StatefulWidget> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.lproducts.length >= 1) {
      return InkWell(
        onTap: widget.onPressed,
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue[900], Colors.blue[400]],
                  begin: FractionalOffset(0.2, 0.0),
                  end: FractionalOffset(1.0, 0.6),
                  stops: [0.0, 0.6],
                  tileMode: TileMode.clamp)),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "FINALIZAR PEDIDO",
              style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: "Montserrat",
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: null,
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.grey[500], Colors.grey[300]],
                  begin: FractionalOffset(0.2, 0.0),
                  end: FractionalOffset(1.0, 0.6),
                  stops: [0.0, 0.6],
                  tileMode: TileMode.clamp)),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "FINALIZAR PEDIDO",
              style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: "Montserrat",
                  color: Colors.white54,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
    }
  }
}
