import 'package:flutter/material.dart';
import 'package:initium/User/ui/widgets/tools.widgets/navigation_bar.dart';

class MyOrdersScreen extends StatefulWidget {
  MyOrdersScreen({Key key}) : super(key: key);

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      bottomNavigationBar: NavigationBar(
        products: false,
      ),
      body: Center(),
    );
  }
}
