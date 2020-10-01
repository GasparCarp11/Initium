import 'package:flutter/material.dart';

class Usuario {
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  final String ubication;

  Usuario({
    Key key,
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.photoURL,
    this.ubication,
  });
}
