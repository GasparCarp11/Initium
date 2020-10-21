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
  List<int> pProducts = List<int>();
  UserBloc _userBloc;
  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of(context);
    Map<String, dynamic> infoshop = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: appBar(infoshop["name"], lProducts, context),
      bottomNavigationBar: OrderButton(
        onPressed: () {
          goToFinishOrder(context, lProducts, infoshop, pProducts);
        },
        lproducts: lProducts,
        text: "REVISAR Y FINALIZAR PEDIDO",
        icon: Icons.arrow_forward,
      ),
      backgroundColor: Colors.blueGrey[900],
      body: StreamBuilder(
        stream: _userBloc.showProducts(infoshop["uid"]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none) {
            return loading();
          } else if (snapshot.data == null) {
            return error();
          } else if (snapshot.hasData) {
            List<DocumentSnapshot> data = snapshot.data.docs;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, index) {
                  Map<String, dynamic> products = data[index].data();
                  return productslist(products);
                });
          }
        },
      ),
    );
  }

  ListTile productslist(Map<String, dynamic> products) {
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
      trailing: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.blueGrey[800],
            borderRadius: BorderRadius.circular(25.0)),
        child: Icon(
          Icons.add,
          color: Colors.blueAccent[400],
        ),
      ),
      isThreeLine: true,
      dense: false,
      contentPadding: EdgeInsets.only(left: 5, right: 12, top: 8),
      onTap: () {
        lProducts.add(products["name"]);
        pProducts.add(products["prize"]);
        setState(() {});
      },
    );
  }

  Column error() {
    return Column(
      children: [
        Text("Error al obtener información de los productos"),
        Text("VOLVER ATRÁS"),
        IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context))
      ],
    );
  }

  Center loading() {
    return Center(
      child: Column(
        children: [
          Text("Obteniendo información de los productos"),
          CircularProgressIndicator(),
        ],
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
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  lproducts.length.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                    icon: Icon(Icons.shopping_cart, color: Colors.white),
                    onPressed: () => showProducts(lproducts, context))
              ],
            ),
          ),
        ],
        title: Text(
          title,
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            }));
  }
}

showProducts(List lproducts, BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
          titleTextStyle: TextStyle(
              color: Colors.blue[900],
              fontSize: 24,
              fontWeight: FontWeight.w500),
          backgroundColor: Colors.blueGrey[600],
          contentPadding: EdgeInsets.only(left: 10.0, top: 10.0),
          actionsPadding:
              EdgeInsets.only(left: 15.0, bottom: 15.0, right: 15.0, top: 8.0),
          actions: <Widget>[
            RaisedButton(
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Text(
                    "Continuar comprando",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontFamily: "Montserrat"),
                  ),
                ),
                color: Colors.blue[900],
                onPressed: () => Navigator.pop(context))
          ],
          title: Text(
            "PEDIDO",
            textAlign: TextAlign.center,
          ),
          content: ListView.builder(
            itemCount: lproducts.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  "-${lproducts[index]}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              );
            },
          ));
    },
  );
}

goToFinishOrder(
    BuildContext context, List lproducts, Map infoshop, List pproducts) {
  Navigator.pushNamed(context, "finish_order", arguments: <String, dynamic>{
    "infoshop": infoshop,
    "lproducts": lproducts,
    "pproducts": pproducts,
  });
}
