import 'package:flutter/material.dart';
import 'package:initium/User/ui/screens/finish_order.dart';
import 'package:initium/User/ui/screens/initium_screen.dart';
import 'package:initium/User/ui/screens/last_screen_order.dart';

import 'package:initium/User/ui/screens/my_orders.dart';
import 'package:initium/User/ui/screens/products_screen.dart';
import 'package:initium/User/ui/screens/sign_in_screen.dart';
import 'package:initium/User/ui/screens/account_user_screen.dart';

Map<String, WidgetBuilder> getNamedRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => SignInScreen(),
    'user_account': (BuildContext context) => AccountUserScreen(),
    'products': (BuildContext context) => ProductsScreen(),
    'initium': (BuildContext context) => InitiumScreen(),
    'my_orders': (BuildContext context) => MyOrdersScreen(),
    'finish_order': (BuildContext context) => FinishOrderScreen(),
    'last': (BuildContext context) => LastScreenOrder(),
  };
}
