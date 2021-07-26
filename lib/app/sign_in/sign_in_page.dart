import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/services/auth.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_flutter_course/app/sign_in/social_sign_in_button.dart';

class SignInPage extends StatelessWidget {
  final void Function(User) onSignIn;
  final AuthBase authBase;

  const SignInPage({
    Key key,
    @required this.onSignIn,
    @required this.authBase,
  }) : super(key: key);

  Future<void> _signInAnonymously() async {
    try {
      final user = await authBase.signInAnonymously();
      onSignIn(user);
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
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 32,
            ),
          ),
          SizedBox(height: 48),
          SocialSignInButton(
            text: 'Sign in With Google',
            color: Colors.white,
            textColor: Colors.black87,
            onPressed: () {},
            image: 'assets/images/google-logo.png',
          ),
          smallSpace(),
          SocialSignInButton(
            text: 'Sign in With Facebook',
            color: Color(0xFF334D92),
            textColor: Colors.white,
            onPressed: () {},
            image: 'assets/images/facebook-logo.png',
          ),
          smallSpace(),
          SignInButton(
            text: 'Sign in With Email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: () {},
          ),
          smallSpace(),
          Text(
            'or',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          SignInButton(
            text: 'Go anonymous',
            textColor: Colors.black87,
            color: Colors.lime[300],
            onPressed: _signInAnonymously,
          ),
        ],
      ),
    );
  }

  SizedBox smallSpace() => const SizedBox(height: 8);
}
