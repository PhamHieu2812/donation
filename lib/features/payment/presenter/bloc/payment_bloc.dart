import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:donation/core/injection.dart';
import 'package:donation/features/login/presenter/bloc/login_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  Future<bool> payment(int amount) async {
    String accessToken = getIt.get<LoginBloc>().access_token;
    var headers = {
      "Authorization": "Bearer " + accessToken,
    };
    var body = {
      "from_account_id": 123,
      "to_account_id": 124,
      "amount": amount,
      "currency": "USD"
    };

    http.Response response = await http.post(
      Uri.parse("http://10.0.2.2:8080/transfers"),
      headers: headers,
      body: json.encode(body),
    );
    var responseData = jsonDecode(response.body) as Map;
    if (responseData["error"] != null) {
      log("transfer failed");
      return false;
    } else {
      log("transfer success");
      return true;
    }
  }
}
