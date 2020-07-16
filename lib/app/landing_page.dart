import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/app/home_page_screen.dart';
import 'package:time_tracker/app/sign_in/sign_in_screen.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  FirebaseUser _user;

  _updateUser(FirebaseUser user) {
    setState(() {
      _user = user;
    });
  }

  _getUser() async {
    var user = await FirebaseAuth.instance.currentUser();
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
        onSignIn: _updateUser,
      );

    return HomePageScreen(
      onSignOut: () => _updateUser(null),
    );
  }
}
