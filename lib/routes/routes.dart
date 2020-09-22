import 'package:flutter/material.dart';
import 'package:initium/User/ui/screens/home_screen.dart';
import 'package:initium/User/ui/screens/sign_in_screen.dart';
import 'package:initium/User/ui/screens/tutorial_screen.dart';
import 'package:initium/User/ui/screens/user_account_screen.dart';

Map<String, WidgetBuilder> getNamedRoutes() {
  return <String, WidgetBuilder>{
    // devuelvo un mapa de rutas con su nombre y su destino
    '/': (context) => SignInScreen(),
    'user_account': (BuildContext context) => UserAccountScreen(),
    'tutorial': (BuildContext context) => TutorialScreen(),
    'home': (BuildContext context) => HomeScreen(),
  };
}
