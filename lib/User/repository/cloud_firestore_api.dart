import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:initium/User/model/order.dart';
import 'package:initium/User/model/usuario.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String ORDERS = "orders";
  final String SHOPS = "shops";

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void addOrder(Order order, Usuario user) async {
    CollectionReference orders = _db.collection("orders");
    return orders.doc(order.uidorder).set({
      'shop': order.uidshop,
      'buyer': user.uid,
      'amoont': order.ammount,
      'products': order.products,
    }, SetOptions(merge: true));
  }

  void updateUserData(Usuario user) async {
    DocumentReference ref = _db.collection(USERS).doc(user.uid);
    return ref.set({
      "uid": user.uid,
      "name": user.name,
      "email": user.email,
      "photoURL": user.photoURL,
      "ubication": user.ubication,
      "lastSignIn": DateTime.now(),
    }, SetOptions(merge: true));
  }
}
