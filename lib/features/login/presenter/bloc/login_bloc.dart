import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {}

  Future<bool> login(String email, String password) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      log('Sign in successfully');
      return true;
    } catch (e) {
      log(e.toString());
    }
    return false;
  }
}
