import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:initium/User/bloc/bloc_user.dart';
import 'package:initium/User/model/usuario.dart';
import 'package:initium/User/ui/screens/products_screen.dart';
import 'package:initium/User/ui/widgets/tools.widgets/navigation_bar.dart';

class InitiumScreen extends StatefulWidget {
  @override
  _InitiumScreenState createState() => _InitiumScreenState();
}

class _InitiumScreenState extends State<InitiumScreen> {
  UserBloc _userBloc;
  Usuario usuario;

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of(context);
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: createAppBar(),
        bottomNavigationBar: NavigationBar(
          products: false,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _userBloc.listshops,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.connectionState == ConnectionState.none) {
                return Center(
                  child: Column(
                    children: [
                      Text("Obteniendo información de los locales "),
                      CircularProgressIndicator(),
                    ],
                  ),
                );
              } else if (snapshot.data == null) {
                return Center(
                    child: Text("Error al obtener información de los locaes"));
              } else if (snapshot.hasData) {
                List<DocumentSnapshot> data = snapshot.data.docs;
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, index) {
                      Map<String, dynamic> shops = data[index].data();
                      print("Info Initium");
                      print(shops);
                      return ListTile(
                        leading: CircleAvatar(
                          minRadius: 15.0,
                          maxRadius: 20.0,
                          backgroundImage: NetworkImage(shops["photoURL"]),
                        ),
                        title: Text(
                          shops["name"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          shops["address"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        isThreeLine: true,
                        dense: false,
                        contentPadding: EdgeInsets.all(8.0),
                        onTap: () {
                          Navigator.pushNamed(context, "products",
                              arguments: shops);
                        },
                      );
                    });
              }
            }));
  }

  Widget createAppBar() {
    return AppBar(
      shadowColor: Colors.black,
      backgroundColor: Colors.transparent,
      brightness: Brightness.dark,
      actionsIconTheme: IconThemeData(),
      actions: [],
      title: Text(
        "Comercios en Initium",
        style: TextStyle(fontSize: 20.0),
      ),
      leading: SizedBox(),
      centerTitle: true,
    );
  }
}
