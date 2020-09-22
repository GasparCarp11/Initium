import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:initium/User/model/usuario.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String ORDERS = "orders";

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void updateUserData(Usuario user) async {
    DocumentReference ref = _db.collection(USERS).doc(user.uid);
    return ref.set({
      "uid": user.uid,
      "name": user.name,
      "email": user.email,
      "photoURL": user.photoURL,
      "myOrders": user.myOrders,
      "ubication": user.ubication,
      "lastSignIn": DateTime.now(),
    }, SetOptions(merge: true));
  }
}
