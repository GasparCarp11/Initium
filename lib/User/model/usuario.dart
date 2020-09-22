import 'package:flutter/material.dart';
import 'package:initium/Order/model/order.dart';

class Usuario {
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  final String ubication;
  final List<Order> myOrders;

  Usuario(
      {Key key,
      @required this.uid,
      @required this.name,
      @required this.email,
      @required this.photoURL,
      this.ubication,
      this.myOrders});
}
