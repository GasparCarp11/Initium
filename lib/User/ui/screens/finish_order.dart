import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:initium/User/bloc/bloc_user.dart';
import 'package:initium/User/model/order.dart';
import 'package:initium/User/ui/widgets/tools.widgets/orderButton.dart';

class FinishOrderScreen extends StatefulWidget {
  FinishOrderScreen({Key key});

  final int uiOrder = Random().nextInt(150000);

  @override
  _FinishOrderScreenState createState() => _FinishOrderScreenState();
}

class _FinishOrderScreenState extends State<FinishOrderScreen> {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of(context);
    Map<String, dynamic> data = ModalRoute.of(context).settings.arguments;
    Map<String, dynamic> infoshop = data["infoshop"];
    List<String> products = data["lproducts"];
    List<int> pproducts = data["pproducts"];
    int total = 0;
    pproducts.forEach((element) {
      total = element + total;
    });

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: appBarFinishOrder(widget.uiOrder, infoshop["name"], total),
      bottomNavigationBar: OrderButton(
        onPressed: () {
          userBloc.updateOrderData(Order(
            uidshop: infoshop["uid"],
            uidorder: widget.uiOrder.toString(),
            products: products,
            total: total,
            isReady: false,
          ));
          Navigator.pushNamed(context, "last");
        },
        lproducts: products,
        text: "CONFIRMAR PEDIDO",
        icon: Icons.touch_app,
      ),
      body: createBody(products, pproducts),
    );
  }

  Widget appBarFinishOrder(int uiOrder, String nameShop, int total) {
    return AppBar(
        shadowColor: Colors.black,
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        actionsIconTheme: IconThemeData(),
        actions: [
          IconButton(
              icon: Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
              onPressed: () {
                showTotal(context, uiOrder, nameShop, total);
              })
        ],
        title: Text(
          "PEDIDO #${uiOrder.toString()}",
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            }));
  }

  Widget createBody(List<String> products, List<int> pproducts) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
            contentPadding: EdgeInsets.only(right: 15.0, left: 10.0),
            leading: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  products.removeAt(index);
                  pproducts.removeAt(index);
                  setState(() {});
                }),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  color: Colors.transparent,
                ),
                Container(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(products[index],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500)),
                ),
                Divider(
                  thickness: 1.5,
                  color: Colors.transparent,
                )
              ],
            ),
            trailing: Text("\$${pproducts[index].toString()}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500)),
            onTap: () {},
          );
        });
  }
}

showTotal(BuildContext context, int uiOrder, String nameShop, int total) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
            contentPadding: EdgeInsets.all(10.0),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "PEDIDO: #${uiOrder.toString()}",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "COMERCIO:$nameShop",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "TOTAL: \$${total.toString()}",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ));
}
