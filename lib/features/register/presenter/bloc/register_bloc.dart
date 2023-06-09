import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Cubit<RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {}
  Future<bool> registerUser(String email, String password) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      log('Register Succesfully');
      return true;
    } catch (e) {
      log(e.toString());
    }
    return false;
  }
}
