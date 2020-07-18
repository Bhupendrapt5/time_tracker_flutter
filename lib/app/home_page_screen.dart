import 'package:flutter/material.dart';
import 'package:time_tracker/app/services/auth.dart';

class HomePageScreen extends StatelessWidget {

  final AuthBase autBase;

  const HomePageScreen({Key key, @required this.autBase})
      : super(key: key);
  Future<void> _signOut() async {
    try {
      await autBase.signOut();
      print('Sign out called');
    } catch (e) {
      print('error : ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        actions: [
          FlatButton(
            onPressed: _signOut,
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Text('Home page'),
      ),
    );
  }
}
