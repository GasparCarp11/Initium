import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:initium/User/model/usuario.dart';
import 'package:initium/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(Usuario user) =>
      _cloudFirestoreAPI.updateUserData(user);
}
