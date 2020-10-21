import 'package:flutter/material.dart';
import 'package:initium/User/ui/widgets/tools.widgets/orderButton.dart';

class LastScreenOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("PEDIDO REALIZADO",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
            Image(
              image: AssetImage("assets/tick1.png"),
              color: Colors.blue[600],
              width: MediaQuery.of(context).size.width - 50,
              height: 150,
            ),
            SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "my_orders");
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue[900], Colors.blue[400]],
                      begin: FractionalOffset(0.2, 0.0),
                      end: FractionalOffset(1.0, 0.6),
                      stops: [0.0, 0.6],
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "IR A MIS PEDIDOS",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: "Montserrat",
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
