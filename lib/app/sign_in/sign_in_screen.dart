import 'package:flutter/material.dart';
import 'package:time_tracker/app/sign_in/email_sign_in_screen.dart';
import 'package:time_tracker/app/sign_in/sign_in_button.dart';
import 'package:time_tracker/app/services/auth.dart';
import 'package:time_tracker/app/sign_in/social_sign_in_button.dart';

class SignInScreen extends StatelessWidget {
  final AuthBase autBase;
  SignInScreen({
    Key key,
    @required this.autBase,
  }) : super(key: key);

  // final _firebaseInstance = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 5,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.blueGrey.shade50,
    );
  }

  Widget _buildContent(BuildContext context) {
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
            onPressed: () => _signInWithEmail(context),
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

  void _signInWithGoogle() async {
    try {
      await autBase.signInWithGoogle();
      print('Google Sign In');
    } catch (e) {
      print('Error:  ${e.toString()}');
    }
  }

  void _signInWithFaceBook() {
    print('Facebook Sign In');
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (ctx) => EmailSignInScreen(
          auth: autBase,
        ),
      ),
    );
  }

  Future<void> _signInAnonymous() async {
    try {
      await autBase.signInAnonymously();
    } catch (e) {
      print('Error:  ${e.toString()}');
    }
  }
}
