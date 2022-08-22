import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthBase {
  User? get currentUser;
  Future<User?> createUser(Map<String, dynamic> map);
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  
  @override
  Future<User?> createUser(Map<String, dynamic> map) async {
    final UserCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: map['email'], password: map['password']);
    FirebaseFirestore.instance
        .collection('users')
        .doc(UserCredential.user!.uid)
        .set({
      'name': map['name'],
      'email': map['email'],
      'instagram': map['instagram'],
      'pix': map['pix'],
      'balance': 0,
    });
  }

  Future<User?> signInWithEmail(String email, String password) async {
    final UserCredential = await _firebaseAuth.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password),
    );
    return UserCredential.user;
  }

  @override
  User? get currentUser => throw UnimplementedError();

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
