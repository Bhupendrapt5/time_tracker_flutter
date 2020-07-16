import 'package:flutter/material.dart';
import 'package:time_tracker/app/custom_widgts/custom_raised_button.dart';
import 'package:time_tracker/app/sign_in/sign_in_button.dart';
import 'package:time_tracker/app/sign_in/social_sign_in_button.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 5,
      ),
      body: _buildContent(),
      backgroundColor: Colors.blueGrey.shade50,
    );
  }

  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              color: Colors.blueGrey.shade700,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          SocialSignInButton(
            color: Colors.white,
            onPressed: _signInWithGoogle,
            text: 'Sign-In with Google',
            textColor: Colors.black54,
            logoPath: 'assets/images/google-logo.png',
          ),
          SizedBox(
            height: 16,
          ),
          SocialSignInButton(
            color: Colors.indigo,
            onPressed: _signInWithFaceBook,
            text: 'Sign In with FaceBook',
            textColor: Colors.white,
            logoPath: 'assets/images/facebook-logo.png',
          ),
          SizedBox(
            height: 16,
          ),
          SignInButton(
            color: Colors.teal.shade600,
            onPressed: _signInWithEmail,
            text: 'Sign In with Email',
            textColor: Colors.white,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Or',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 16,
          ),
          SignInButton(
            color: Colors.orangeAccent,
            onPressed: _signInAnonymous,
            text: 'Go anonymous',
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }

  void _signInWithGoogle() {
    //TODO: Implement Google Sign-In
    print('Google Sign In');
  }

  void _signInWithFaceBook() {
    //TODO: Implement Facebook Sign-In
    print('Facebook Sign In');
  }

  void _signInWithEmail() {
    //TODO: Implement Google Sign-In
    print('Email Sign In');
  }

  void _signInAnonymous() {
    //TODO: Implement Google Sign-In
    print('Anonymous Sign In');
  }
}
