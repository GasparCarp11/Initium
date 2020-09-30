import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:initium/User/bloc/bloc_user.dart';
import 'package:linear_gradient/linear_gradient.dart';

class ListShops extends StatelessWidget {
  final Map data;

  ListShops({Key key, @required this.data});

  @override
  Widget build(BuildContext context) {
    String address;

    if (data['address'] != null) {
      address = data['address'];
    } else {
      address = "";
    }

    if (data['available'] == true) {
      return Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.only(left: 8.0),
        width: MediaQuery.of(context).size.width,
        height: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradientStyle.linearGradient(
              orientation: LinearGradientStyle.ORIENTATION_HORIZONTAL,
              gradientType: LinearGradientStyle.GRADIENT_TYPE_MIDNIGHT_CITY,
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 10.0,
                  spreadRadius: 3.0,
                  offset: Offset(2.0, 10.0))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data["name"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  address,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue[600],
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
