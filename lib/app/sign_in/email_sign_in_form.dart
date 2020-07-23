import 'package:flutter/material.dart';
import 'package:time_tracker/app/custom_widgts/form_submit_raised_button.dart';
import 'package:time_tracker/app/custom_widgts/platform_alert_dialog.dart';
import 'package:time_tracker/app/services/auth.dart';
import 'package:time_tracker/app/sign_in/validators.dart';

enum EmailSignInFormType {
  SignIn,
  SignUp,
}

class EmailSignInForm extends StatefulWidget
    with EmailAndPasswordNonEmptyValidator {
  final AuthBase auth;

  EmailSignInForm({Key key, this.auth}) : super(key: key);
  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  EmailSignInFormType _formType = EmailSignInFormType.SignIn;
  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  bool _formSubmited = false;

  List<Widget> _buildChildern() {
    final _primaryText = _formType == EmailSignInFormType.SignIn
        ? 'Sign In'
        : 'Create an account ';
    final _secondaryText = _formType == EmailSignInFormType.SignIn
        ? 'Need an account? Register'
        : 'Have an account? Sign In';

    _submitEnabled = widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_password) &&
        !_formSubmited;
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
        onPressed: _submitEnabled ? _submit : null,
        text: _primaryText,
      ),
      SizedBox(
        height: 8,
      ),
      FlatButton(
        onPressed: !_formSubmited ? _toggleFrom : null,
        child: Text(_secondaryText),
      )
    ];
  }

  TextField _passwrodTextField() {
    return TextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(
        labelText: 'Password',
      ),
      textInputAction: TextInputAction.done,
      obscureText: true,
      onChanged: (value) => updateSubmiButton(),
      onEditingComplete: _submit,
    );
  }

  TextField _emailTextField() {
    return TextField(
        controller: _emailController,
        focusNode: _emailFocusNode,
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'test@test.com',
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        autocorrect: false,
        onChanged: (value) => updateSubmiButton(),
        onEditingComplete: () {
          final _newFocus = widget.emailValidator.isValid(_email)
              ? _passwordFocusNode
              : _emailFocusNode;
          FocusScope.of(context).requestFocus(_newFocus);
        });
  }

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _submitEnabled = false;
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
    print('email : $_email');

    setState(() {
      _formSubmited = true;
    });
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
      PlatFormAlertDialogBox(
        title: 'Sign In Failed',
        content: 'Something went wrong',
        defaultActionText: 'Ok',
      ).show(context);
    } finally {
      setState(() {
        _formSubmited = false;
      });
    }
  }

  void updateSubmiButton() {
    setState(() {});
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
