import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithCredential(AuthCredential credential) =>
      _auth.signInWithCredential(credential);
  Future<void> logout() => _auth.signOut();
  Stream<User> get currentUser => _auth.authStateChanges();
  Future<void> createUserWithEmailAndPassword({
    @required String email,
    @required String password,
  }) =>
      _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

  Future<void> signInWithEmailAndPassword({
    @required String email,
    @required String password,
  }) =>
      _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
}
