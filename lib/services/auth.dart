import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyUser{
  final String uid;
  MyUser({@required this.uid});
}

abstract class AuthBase{
  MyUser currentUser();
  Future<MyUser> signInAnonymously();
  Future<void> signOut();
}

class Auth implements AuthBase{
  final _firebaseAuth = FirebaseAuth.instance;

  MyUser _userFromFirebase(User user){
    if(user == null){
      return null;
    }
    return MyUser(uid: user.uid);
  }
  @override
  MyUser currentUser() {
    return _userFromFirebase(_firebaseAuth.currentUser);
  }
  @override
  Future<MyUser> signInAnonymously() async{
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }
  @override
  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }


}
