import 'package:flutter/material.dart';
import 'package:initium/Order/screens/my_orders.dart';
import 'package:initium/User/ui/screens/initium_screen.dart';
import 'package:initium/User/ui/screens/products_screen.dart';
import 'package:initium/User/ui/screens/sign_in_screen.dart';
import 'package:initium/User/ui/screens/account_user_screen.dart';

Map<String, WidgetBuilder> getNamedRoutes() {
  return <String, WidgetBuilder>{
    // devuelvo un mapa de rutas con su nombre y su destino
    '/': (BuildContext context) => SignInScreen(),
    'user_account': (BuildContext context) => AccountUserScreen(),
    'products': (BuildContext context) => ProductsScreen(),
    'initium': (BuildContext context) => InitiumScreen(),
    'my_orders': (BuildContext context) => MyOrdersScreen()
  };
}
