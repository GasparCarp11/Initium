import 'package:flutter/material.dart';

class Order {
  final String uid;
  final String shop;
  final String buyer;
  final List products;
  final int ammount;

  Order({
    Key key,
    @required this.shop,
    @required this.uid,
    @required this.buyer,
    @required this.products,
    @required this.ammount,
  });
}
