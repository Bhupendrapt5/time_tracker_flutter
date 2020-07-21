import 'package:flutter/material.dart';
import 'package:time_tracker/app/services/auth.dart';
import 'package:time_tracker/app/sign_in/email_sign_in_form.dart';

class EmailSignInScreen extends StatelessWidget {
  final AuthBase auth;

  const EmailSignInScreen({Key key, this.auth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: EmailSignInForm(
            auth: auth,
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey.shade50,
    );
  }
}
