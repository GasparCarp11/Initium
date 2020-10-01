import 'package:flutter/material.dart';

class ListShops extends StatelessWidget {
  final Map data;

  ListShops({
    Key key,
    @required this.data,
  });

  @override
  Widget build(BuildContext context) {
    if (data['available'] == true) {
      return Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.only(left: 8.0),
        width: MediaQuery.of(context).size.width - 20,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blueGrey[600],
            width: 5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.grey[900],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage(
                fadeInCurve: Curves.bounceIn,
                placeholder: AssetImage('assets/loading.gif'),
                fadeInDuration: Duration(milliseconds: 10),
                image: NetworkImage(data["photoURL"]),
                fit: BoxFit.contain,
                height: 70,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data["name"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  data["address"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "products", arguments: {
                    "uid": data['uid'],
                    "name": data['name'],
                    "photoURL": data['photoURL'],
                    "address": data['address']
                  });
                })
          ],
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.only(left: 8.0),
        width: MediaQuery.of(context).size.width,
        height: 130,
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
                image: NetworkImage(data["photoURL"]),
                fit: BoxFit.contain,
                height: 90,
              ),
            ),
            SizedBox(
              width: 15.0,
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
