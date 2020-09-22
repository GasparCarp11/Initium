import 'package:flutter/material.dart';
import 'package:initium/User/model/usuario.dart';

class Order {
  Usuario buyer;
  String shop;
  String id;
  List products;
  int price;

  Order({
    Key key,
    @required this.shop,
    @required this.buyer,
    @required this.products,
    @required this.price,
    this.id,
  });
}
