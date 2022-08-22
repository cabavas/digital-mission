import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class AuthBase {
  User? get currentUser;
  Future<User?> createUser(BuildContext context, Map<String, dynamic> map);
  Future<void> signOut();
}

class Auth implements AuthBase {
  String errorMessage = '';
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> createUser(
      BuildContext context, Map<String, dynamic> map) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: map['email'], password: map['password']);
      FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': map['name'],
        'email': map['email'],
        'instagram': map['instagram'],
        'pix': map['pix'],
        'balance': 0,
        'VIP': false,
      });
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/success');
      return null;
    } on FirebaseException catch (e) {
      if (e.code == 'email-already-in-use') {
        errorMessage = 'Este e-mail já foi cadastrado';
      } else {
        errorMessage = 'Ocorreu um erro inesperado';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Container(
            padding: const EdgeInsets.all(16),
            height: 90,
            decoration: BoxDecoration(
              color: const Color(0xff045eac),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                errorMessage,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    }
    return null;
  }

  Future<User?> signInWithEmail(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password),
    );
    return userCredential.user;
  }

  @override
  User? get currentUser => throw UnimplementedError();

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
