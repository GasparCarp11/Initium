import 'package:flutter/material.dart';

class ListProducts extends StatefulWidget {
  final Map<String, dynamic> data;

  ListProducts({
    Key key,
    @required this.data,
  });

  @override
  _ListProductsState createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  List<String> products = List<String>(15);
  int ammount;

  @override
  Widget build(BuildContext context) {
    print(widget.data);
    if (widget.data['available'] == true) {
      return Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.only(left: 8.0),
          width: MediaQuery.of(context).size.width - 20,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.blueGrey[900],
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.blue[100],
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                    offset: Offset(2.0, 5.0))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: FadeInImage(
                  fadeInCurve: Curves.bounceIn,
                  placeholder: AssetImage('assets/loading.gif'),
                  fadeInDuration: Duration(milliseconds: 10),
                  image: NetworkImage(widget.data["photoURL"]),
                  fit: BoxFit.contain,
                  height: 70,
                  width: 80,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                width: 250,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.data["name"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      "\$${widget.data["prize"].toString()}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    RaisedButton(
                      color: Colors.blueGrey[900],
                      onPressed: () {
                        addToOrder();
                      },
                      textColor: Colors.white,
                      padding: EdgeInsets.all(0.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: LinearGradient(
                            colors: [Colors.blue[600], Colors.blue[900]],
                          ),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Text('COMPRAR', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ));
    } else {
      return Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.only(left: 8.0),
        width: MediaQuery.of(context).size.width,
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.black,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 10.0,
                  spreadRadius: 3.0,
                  offset: Offset(2.0, 10.0))
            ]),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                fadeInDuration: Duration(milliseconds: 10),
                image: NetworkImage(widget.data["photoURL"]),
                fit: BoxFit.contain,
                height: 60,
              ),
            ),
            SizedBox(
              width: 30.0,
            ),
            Text(
              "NO DISPONIBLE",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      );
    }
  }
}

addToOrder() {}
