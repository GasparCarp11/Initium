import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:initium/User/bloc/bloc_user.dart';
import 'package:initium/User/ui/widgets/list_shops.dart';

class ProductsScreen extends StatelessWidget {
  var info;
  UserBloc _userBloc;

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of(context);
    Map data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: _userBloc.showProducts(data['uid']),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: Column(
                    children: [
                      Text("Error al obtener la información de los locales"),
                      CircularProgressIndicator(),
                    ],
                  ),
                );
              } else if (snapshot.hasData) {
                List<DocumentSnapshot> info = snapshot.data.docs;
                return ListView.builder(
                    itemCount: info.length,
                    itemBuilder: (BuildContext context, index) {
                      Map<String, dynamic> products = info[index].data();
                      return ListShops(data: products);
                    });
              }
            }));
  }
}
