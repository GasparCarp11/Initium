import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Order {
  final String uidorder;
  final String uidshop;
  final String buyer;
  final List products;
  final int total;
  final bool isReady;

  Order({
    Key key,
    @required this.uidshop,
    @required this.uidorder,
    this.buyer,
    @required this.products,
    @required this.total,
    @required this.isReady,
  });
}
