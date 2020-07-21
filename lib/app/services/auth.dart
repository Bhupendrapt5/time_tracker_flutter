import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class User {
  final String uId;
  final String displayName;
  final String email;
  final String phoneNumber;

  User({
    @required this.uId,
    this.displayName,
    this.email,
    this.phoneNumber,
  });
}

abstract class AuthBase {
  Future<User> currentUser();
  Future<User> signInAnonymously();
  Future<User> signInWithEmail(String email, String password);
  Future<User> createUser(String email, String password);
  Future<User> signInWithGoogle();
  Future<void> signOut();
  Stream<User> get onAuthStateChange;
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    if (user == null) return null;
    return User(
      uId: user.uid,
      displayName: user.displayName,
      email: user.email,
      phoneNumber: user.phoneNumber,
    );
  }

  @override
  Stream<User> get onAuthStateChange =>
      _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);

  @override
  Future<User> currentUser() async {
    var user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }

  @override
  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }

  @override
  Future<User> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final account = await googleSignIn.signIn();
    if (account != null) {
      final _googleAuth = await account.authentication;
      if (_googleAuth.accessToken != null && _googleAuth.idToken != null) {
        final _authResult = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.getCredential(
              idToken: _googleAuth.idToken,
              accessToken: _googleAuth.accessToken),
        );
        return _userFromFirebase(_authResult.user);
      } else {
        throw PlatformException(
          code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
          message: 'Missing Google Auth Token.',
        );
      }
    } else {
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign-In aborted by user.',
      );
    }
  }

  @override
  Future<User> signInWithEmail(
    String email,
    String password,
  ) async {
    final _authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(_authResult.user);
  }

  @override
  Future<User> createUser(
    String email,
    String password,
  ) async {
    final _authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(_authResult.user);
  }
}
