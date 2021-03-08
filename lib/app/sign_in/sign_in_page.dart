import 'package:flutter/material.dart';
import 'package:time_tracker/app/sign_in/Sign_in_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Social_sign_in_button.dart';

class SignInPage extends StatelessWidget {
  //Constructor with this parameter;
  SignInPage({@required this.onSignIn});

  //Creating a object for callback which has a type as function and takes 1 parameter and named onSignIn
  final Function(User) onSignIn;

  Future<void> _signInAnonymously() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      onSignIn(userCredential.user);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Time Tracker',
          textAlign: TextAlign.center,
        ),
        elevation: 3.0,
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[100],
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 48.0,
          ),
          SocialSignInButton(
            imageAsset: 'images/google-logo.png',
            text: 'Sign In with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          SocialSignInButton(
            imageAsset: 'images/facebook-logo.png',
            text: 'Sign In with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            text: 'Sign In with Email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            "or",
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.black87,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            text: 'Go Anonymously',
            textColor: Colors.black,
            color: Colors.lime[300],
            onPressed: _signInAnonymously,
          ),
        ],
      ),
    );
  }
}
