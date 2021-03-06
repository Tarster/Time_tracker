import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth.dart';

class HomePage extends StatelessWidget {

  final VoidCallback onSignOut;
  final AuthBase auth;
  HomePage({@required this.auth,@required this.onSignOut});

  Future<void> _signOut() async {
    try {
      await auth.signOut();
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
