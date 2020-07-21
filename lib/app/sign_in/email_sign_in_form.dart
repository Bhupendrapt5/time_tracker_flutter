import 'package:flutter/material.dart';
import 'package:time_tracker/app/custom_widgts/form_submit_raised_button.dart';
import 'package:time_tracker/app/services/auth.dart';

enum EmailSignInFormType {
  SignIn,
  SignUp,
}

class EmailSignInForm extends StatefulWidget {
  final AuthBase auth;

  const EmailSignInForm({Key key, this.auth}) : super(key: key);
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
      _emailTextField(),
      SizedBox(
        height: 8,
      ),
      _passwrodTextField(),
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

  TextField _passwrodTextField() {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
      ),
      textInputAction: TextInputAction.done,
      obscureText: true,
    );
  }

  TextField _emailTextField() {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'test@test.com',
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      autocorrect: false,
    );
  }

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  String get _email => _emailController.text;
  String get _password => _passwordController.text;

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

  void _submit() async {
    try {
      if (_formType == EmailSignInFormType.SignIn) {
        await widget.auth.signInWithEmail(
          _email,
          _password,
        );
      } else {
        await widget.auth.createUser(
          _email,
          _password,
        );
      }
      Navigator.pop(context);
    } catch (err) {
      print('$err');
    }
    print('email : $_email');
    print('pass : $_password');
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
