import 'package:flutter/material.dart';

class Order {
  final String uidorder;
  final String uidshop;
  final String buyer;
  final List products;
  final int ammount;

  Order({
    Key key,
    @required this.uidshop,
    @required this.uidorder,
    this.buyer,
    this.products,
    this.ammount,
  });
}
