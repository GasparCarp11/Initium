import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:initium/User/bloc/bloc_user.dart';
import 'package:initium/User/ui/widgets/list.widgets/list_products.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  UserBloc _userBloc;

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of(context);
    Map data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: StreamBuilder<QuerySnapshot>(
            stream: _userBloc.showProducts(data['uid']),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.connectionState == ConnectionState.none) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Obteniendo información de los prodcutos "),
                      CircularProgressIndicator(),
                    ],
                  ),
                );
              } else if (snapshot.data == null) {
                return Center(
                    child:
                        Text("Erro al obtener información de los productos"));
              } else if (snapshot.hasData) {
                List<DocumentSnapshot> info = snapshot.data.docs;
                return ListView.builder(
                    itemCount: info.length,
                    itemBuilder: (BuildContext context, index) {
                      Map<String, dynamic> products = info[index].data();
                      print("Info products");
                      print(products);
                      return ListProducts(data: products);
                    });
              }
            }));
  }
}
