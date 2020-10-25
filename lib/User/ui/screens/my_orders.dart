import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:initium/User/bloc/bloc_user.dart';
import 'package:initium/User/ui/widgets/tools.widgets/navigation_bar.dart';

class MyOrdersScreen extends StatefulWidget {
  MyOrdersScreen({Key key}) : super(key: key);

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  UserBloc _userBloc;
  String idOrder;

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of(context);
    return Scaffold(
        appBar: createAppBar(),
        backgroundColor: Colors.blueGrey[900],
        bottomNavigationBar: NavigationBar(
          products: false,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _userBloc.showOrders(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.connectionState == ConnectionState.none) {
                return Center(
                  child: Column(
                    children: [
                      Text("Obteniendo información de tus pedidos"),
                      CircularProgressIndicator(),
                    ],
                  ),
                );
              } else if (snapshot.data == null) {
                return Center(
                    child: Text("Error al obtener información de tus pedidos"));
              } else if (snapshot.hasData) {
                List<DocumentSnapshot> data = snapshot.data.docs;

                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, index) {
                      Map<String, dynamic> orders = data[index].data();
                      return listOrders(orders);
                    });
              }
            }));
  }

  Widget listOrders(Map<String, dynamic> orders) {
    return FutureBuilder(
      future: _userBloc.showShop(orders["uidshop"]),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
                "Estamos teniendo problemas para cargar sus pedidos\nPor favor contáctese con soporte"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> infoshop = snapshot.data.data();

          if (orders["isReady"] == true) {
            return InkWell(
              highlightColor: Colors.blueAccent[700],
              splashColor: Colors.blueAccent[700],
              onTap: () {
                Navigator.pushNamed(context, "blue",
                    arguments: orders["uidorder"]);
              },
              child: Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                width: MediaQuery.of(context).size.width - 20,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueAccent[700],
                    width: 5,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey[900],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: FadeInImage(
                        fadeInCurve: Curves.bounceIn,
                        placeholder: AssetImage('assets/loading.gif'),
                        fadeInDuration: Duration(milliseconds: 10),
                        image: NetworkImage(infoshop["photoURL"]),
                        fit: BoxFit.contain,
                        height: 70,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "PEDIDO #${orders["uidorder"]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          "TOTAL: \$${orders["ammount"].toString()}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          "LISTO PARA RETIRAR: SÍ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.blueAccent[700],
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey[850],
                          borderRadius: BorderRadius.circular(25.0)),
                      child: Icon(
                        Icons.bluetooth,
                        color: Colors.blueAccent[700],
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          if (orders["isReady"] == false) {
            return InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
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
                      borderRadius: BorderRadius.circular(20.0),
                      child: FadeInImage(
                        fadeInCurve: Curves.bounceIn,
                        placeholder: AssetImage('assets/loading.gif'),
                        fadeInDuration: Duration(milliseconds: 10),
                        image: NetworkImage(infoshop["photoURL"]),
                        fit: BoxFit.contain,
                        height: 70,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "PEDIDO #${orders["uidorder"]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          "TOTAL: \$${orders["ammount"].toString()}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          "LISTO PARA RETIRAR: NO",
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
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey[850],
                          borderRadius: BorderRadius.circular(25.0)),
                      child: Icon(
                        Icons.bluetooth_disabled,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }
        return Center(
          child: Text("Cargando"),
        );
      },
    );
  }

  Widget createAppBar() {
    return AppBar(
      shadowColor: Colors.black,
      backgroundColor: Colors.transparent,
      brightness: Brightness.dark,
      actionsIconTheme: IconThemeData(),
      actions: [],
      title: Text(
        "Mis Pedidos",
        style: TextStyle(fontSize: 20.0),
      ),
      leading: SizedBox(),
      centerTitle: true,
    );
  }

  Future showOrderID(String uidorder) async {
    var doc_ref = await FirebaseFirestore.instance
        .collection("orders")
        .where("uidorder", isEqualTo: uidorder)
        .get();
    doc_ref.docs.forEach((element) {
      idOrder = element.id;
    });
  }
}
