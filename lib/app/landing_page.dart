import 'package:flutter/material.dart';
import 'package:time_tracker/app/home_page_screen.dart';
import 'package:time_tracker/app/services/auth.dart';
import 'package:time_tracker/app/sign_in/sign_in_screen.dart';

class LandingPage extends StatefulWidget {
  final AuthBase autBase;

  const LandingPage({Key key, this.autBase}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;

  _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  _getUser() async {
    var user = await widget.autBase.currentUser();
    _updateUser(user);
  }

  @override
  void initState() {
    _getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null)
      return SignInScreen(
        autBase: widget.autBase,
        onSignIn: _updateUser,
      );

    return HomePageScreen(
      autBase: widget.autBase,
      onSignOut: () => _updateUser(null),
    );
  }
}
