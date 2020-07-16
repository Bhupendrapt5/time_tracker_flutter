import 'package:flutter/material.dart';
import 'package:time_tracker/app/custom_widgts/custom_raised_button.dart';
import 'package:time_tracker/app/sign_in/sign_in_button.dart';

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
          SignInButton(
            color: Colors.white,
            onPressed: _signInWithGoogle,
            text: 'Sign-In with Google',
            textColor: Colors.black54,
          ),
          SizedBox(
            height: 16,
          ),
          SignInButton(
            color: Colors.indigo,
            onPressed: _signInWithFaceBook,
            text: 'Sign In with FaceBook',
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
    //TODO: Implement Google Sign-In
    print('Facebook Sign In');
  }
}
