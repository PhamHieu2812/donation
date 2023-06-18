import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String access_token = "";
  LoginBloc() : super(LoginInitial()) {}

  Future<bool> login(String email, String password) async {
    var body = {
      "username": email,
      "password": password,
    };
    http.Response response = await http.post(
        Uri.parse("http://10.0.2.2:8080/users/login"),
        body: json.encode(body));
    var responseData = jsonDecode(response.body) as Map;
    if (responseData["access_token"] == null) {
      log("Login failed");
      return false;
    } else {
      log("Login success with access_tken: " + responseData["access_token"]);
      access_token = responseData["access_token"].toString();
      return true;
    }
  }
}
