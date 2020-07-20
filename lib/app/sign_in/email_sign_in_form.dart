import 'package:flutter/material.dart';
import 'package:time_tracker/app/custom_widgts/form_submit_raised_button.dart';

class EmailSignInForm extends StatelessWidget {
  List<Widget> _buildChildern() {
    return [
      TextField(
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'test@test.com',
        ),
      ),
      SizedBox(
        height: 8,
      ),
      TextField(
        decoration: InputDecoration(
          labelText: 'Password',
        ),
        obscureText: true,
      ),
      SizedBox(
        height: 16,
      ),
      FormSubmitRaisedButton(
        onPressed: () {},
        text: 'Sign In',
      ),
      SizedBox(
        height: 8,
      ),
      FlatButton(
        onPressed: () {},
        child: Text('Need an account? Register'),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildern(),
      ),
    );
  }
}
