import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:initium/User/repository/auth_repository.dart';
import 'package:initium/User/repository/firebase_auth_api.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();

  Stream<User> get authStatus => streamFirebase;

  Future<FirebaseUser> signIn() {
    return _auth_repository.signInFirebase();
  }

  @override
  void dispose() {}
}
