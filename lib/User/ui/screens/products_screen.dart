import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:initium/User/bloc/bloc_user.dart';

import 'package:initium/User/ui/widgets/tools.widgets/orderButton.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<String> lProducts = List<String>();
  UserBloc _userBloc;
  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of(context);
    Map<String, dynamic> infoshop = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: appBar(infoshop["name"], lProducts, context),
      bottomNavigationBar: OrderButton(onPressed: null, lproducts: lProducts),
      backgroundColor: Colors.blueGrey[900],
      body: StreamBuilder(
        stream: _userBloc.showProducts(infoshop["uid"]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: Column(
                children: [
                  Text("Obteniendo información de los productos"),
                  CircularProgressIndicator(),
                ],
              ),
            );
          } else if (snapshot.data == null) {
            return Center(
                child: Text("Error al obtener información de los productos"));
          } else if (snapshot.hasData) {
            List<DocumentSnapshot> data = snapshot.data.docs;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, index) {
                  Map<String, dynamic> products = data[index].data();
                  print("Info Initium");
                  print(products);
                  return ListTile(
                    leading: FadeInImage(
                      fadeInCurve: Curves.bounceIn,
                      placeholder: AssetImage('assets/loading.gif'),
                      fadeInDuration: Duration(milliseconds: 10),
                      image: NetworkImage(products["photoURL"]),
                      fit: BoxFit.contain,
                      height: 70,
                      width: 80,
                    ),
                    title: Text(
                      products["name"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "\$${products["prize"].toString()}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                    trailing: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                    ),
                    isThreeLine: true,
                    dense: false,
                    contentPadding: EdgeInsets.all(8.0),
                    onTap: () {
                      lProducts.add(products["name"]);
                      setState(() {});
                      print("lista de productos:");
                      print(lProducts);
                    },
                  );
                });
          }
        },
      ),
    );
  }

  Widget appBar(String title, List lproducts, BuildContext context) {
    return AppBar(
        shadowColor: Colors.black,
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        actionsIconTheme: IconThemeData(),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () => showProducts(lproducts, context)),
          Text(lproducts.length.toString()),
        ],
        title: Text(
          title,
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }));
  }
}

showProducts(List lproducts, BuildContext context) {
  int orderuid = Random().nextInt(30000);
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
          title: Text(
            "PEDIDO #${orderuid.toString()}",
            textAlign: TextAlign.center,
          ),
          content: ListView.builder(
            itemCount: lproducts.length,
            itemBuilder: (context, index) {
              print("primer print");
              print(lproducts);
              return ListTile(
                title: Text(lproducts[index]),
              );
            },
          ));
    },
  );
}
