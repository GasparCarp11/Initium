import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:initium/User/bloc/bloc_user.dart';
import 'package:initium/User/ui/widgets/list_shops.dart';
import 'package:initium/User/ui/widgets/navigation_bar.dart';

class InitiumScreen extends StatelessWidget {
  UserBloc _userBloc;
  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of(context);
    return Scaffold(
        backgroundColor: Colors.blue[900],
        bottomNavigationBar: NavigationBar(),
        body: StreamBuilder<QuerySnapshot>(
            stream: _userBloc.listshops,
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
                List<DocumentSnapshot> shops = snapshot.data.docs;
                print(shops);
                return ListView.builder(
                    itemCount: shops.length,
                    itemBuilder: (BuildContext context, index) {
                      Map<String, dynamic> data = shops[index].data();
                      return Center(
                        child: ListShops(data: data),
                      );
                    });
              }
            }));
  }
}
