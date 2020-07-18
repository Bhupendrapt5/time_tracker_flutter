import 'package:flutter/material.dart';
import 'package:time_tracker/app/home_page_screen.dart';
import 'package:time_tracker/app/services/auth.dart';
import 'package:time_tracker/app/sign_in/sign_in_screen.dart';

class LandingPage extends StatelessWidget {
  final AuthBase autBase;

  const LandingPage({Key key, this.autBase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: autBase.onAuthStateChange,
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          User user = snapshot.data;
          print('user name ; ${user.uId}');
          if (user == null) {
            return SignInScreen(
              autBase: autBase,
            );
          }

          return HomePageScreen(
            autBase: autBase,
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
