import 'package:alcancia_flutter/domain/blocs/base/base_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class UserBloc extends BaseBloc {
  FirebaseUser _user;

  UserBloc();

  Future<bool> attemptLogIn(String email, String password) async {
    final _auth = FirebaseAuth.instance;
    try {
      _user = await _auth.signInWithEmailAndPassword(
          email: email.toLowerCase().trim(), password: password);
      return true;
    } on PlatformException catch (err) {
      return Future.error(err);
    }
  }
}
