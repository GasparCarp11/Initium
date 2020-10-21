import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:initium/User/model/order.dart';
import 'package:initium/User/model/usuario.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String ORDERS = "orders";

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  Future<void> updateOrderData(Order order) async {
    CollectionReference refOrders = _db.collection(ORDERS);
    User user = _auth.currentUser;

    await refOrders.add({
      "uidorder": order.uidorder,
      "buyer": "$USERS/${user.uid}",
      "uidshop": order.uidshop,
      "products": order.products,
      "ammount": order.total,
      "isReady": order.isReady,
      "date": DateTime.now(),
    });
  }

  Stream<QuerySnapshot> showOrders() {
    User user = _auth.currentUser;

    Stream<QuerySnapshot> refOrders = _db
        .collection(ORDERS)
        .where("buyer", isEqualTo: "$USERS/${user.uid}")
        .snapshots();

    return refOrders;
  }
}
