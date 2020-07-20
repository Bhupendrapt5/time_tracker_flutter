import 'package:flutter/material.dart';
import 'package:time_tracker/app/custom_widgts/form_submit_raised_button.dart';

enum EmailSignInFormType {
  SignIn,
  SignUp,
}

class EmailSignInForm extends StatefulWidget {
  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  EmailSignInFormType _formType = EmailSignInFormType.SignIn;
  List<Widget> _buildChildern() {
    final _primaryText = _formType == EmailSignInFormType.SignIn
        ? 'Sign In'
        : 'Create an account ';
    final _secondaryText = _formType == EmailSignInFormType.SignIn
        ? 'Need an account? Register'
        : 'Have an account? Sign In';
    return [
      TextField(
        controller: _emailController,
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'test@test.com',
        ),
      ),
      SizedBox(
        height: 8,
      ),
      TextField(
        controller: _passwordController,
        decoration: InputDecoration(
          labelText: 'Password',
        ),
        obscureText: true,
      ),
      SizedBox(
        height: 16,
      ),
      FormSubmitRaisedButton(
        onPressed: _submit,
        text: _primaryText,
      ),
      SizedBox(
        height: 8,
      ),
      FlatButton(
        onPressed: _toggleFrom,
        child: Text(_secondaryText),
      )
    ];
  }

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

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

  void _submit() {
    print('email : ${_emailController.text}');
  }

  void _toggleFrom() {
    setState(() {
      _formType = _formType == EmailSignInFormType.SignIn
          ? EmailSignInFormType.SignUp
          : EmailSignInFormType.SignIn;
    });

    _emailController.clear();
    _passwordController.clear();
  }
}
