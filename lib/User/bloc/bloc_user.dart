import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:initium/User/model/order.dart';
import 'package:initium/User/model/usuario.dart';
import 'package:initium/User/repository/auth_repository.dart';
import 'package:initium/User/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {
  final auth_repository = AuthRepository();

  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();

  Stream<User> get authStatus => streamFirebase;

  Future<UserCredential> signIn() => auth_repository.signInFirebase();

  signOut() => auth_repository.signOut();

  final _cloudFirestoreRepository = CloudFirestoreRepository();

  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("shops");

  Stream<QuerySnapshot> get listshops => collectionReference.snapshots();

  Future<void> updateOrderData(Order order) =>
      _cloudFirestoreRepository.updateOrderData(order);

  Stream<QuerySnapshot> showProducts(String shopUID) {
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection("shops")
        .doc(shopUID)
        .collection("products");
    return collectionReference.snapshots();
  }

  Future<DocumentSnapshot> showShop(String shopUID) {
    Future<DocumentSnapshot> collectionReference =
        FirebaseFirestore.instance.collection("shops").doc(shopUID).get();
    return collectionReference;
  }

  Stream<QuerySnapshot> showOrders() => _cloudFirestoreRepository.showOrders();

  void updateUserData(Usuario usuario) =>
      _cloudFirestoreRepository.updateUserDataFirestore(usuario);

  @override
  void dispose() {}
}
