import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final VoidCallback onSignOut;

  HomePage({@required this.onSignOut});

  Future<void> _signOut() async {
    try {
      final userCredential = await FirebaseAuth.instance.signOut();
      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          FlatButton(
            onPressed: _signOut,
            child: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
