import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Auth {
  final _firebaseAuth = FirebaseAuth.instance;

  User currentUser() {
    return _firebaseAuth.currentUser;
  }
  Future<User> signInAnonymously() async{
    final authResult = await _firebaseAuth.signInAnonymously();
    return authResult.user;
  }
  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }
}
