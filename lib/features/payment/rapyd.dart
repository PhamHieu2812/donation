import 'dart:convert';
import 'dart:math';
import 'package:convert/convert.dart';
import 'package:http/http.dart' as http;

import 'package:crypto/crypto.dart';

  /*
  
  Card number : 4665 8406 5703 7344
  VD: 06/27
  CVV: 896
  Name: NGUYEN VAN HIEU
  
  */
class Rapyd {
  // Declaring variables
  final String _ACCESS_KEY = "rak_D16D8BF8F648F522C9B4";
  final String _SECRET_KEY =
      "rsk_46f83a189c6b259614e619e9b256a2bc5da33253b5d1baf2dc280ecd23e9dff78a8f3e0c696a3a4a";
  final String _BASEURL = "https://sandboxapi.rapyd.net";
  final double amount;

  Rapyd(this.amount);

  //Generating random string for each request with specific length as salt
  String _getRandString(int len) {
    var values = List<int>.generate(len, (i) => Random.secure().nextInt(256));
    String code = base64Url.encode(values);
    print('RANDOM STRING : ' + code.toString());
    return code;
  }

  //1. Generating body
  Map<String, String> _getBody() {
    Map<String, String> map = <String, String>{
      "amount": amount.toString(),
      "currency": "USD",
      "country": "US",
      "complete_checkout_url": "https://www.rapyd.net/cancel",
      "cancel_checkout_url": "https://www.rapyd.net/cancel"
    };
    print('BODY PARAMETERS : ' + map.toString());
    return map;
  }

  //2. Generating Signature
  String _getSignature(String httpMethod, String urlPath, String salt,
      String timestamp, String bodyString) {
    //concatenating string values together before hashing string according to Rapyd documentation
    String sigString = httpMethod +
        urlPath +
        salt +
        timestamp +
        _ACCESS_KEY +
        _SECRET_KEY +
        bodyString;

    //passing the concatenated string through HMAC with the SHA256 algorithm
    Hmac hmac = Hmac(sha256, utf8.encode(_SECRET_KEY));
    Digest digest = hmac.convert(utf8.encode(sigString));
    var ss = hex.encode(digest.bytes);

    //base64 encoding the results and returning it.
    String code = base64UrlEncode(ss.codeUnits);
    print('SIGNATURE : ' + code.toString());
    return code;
  }

  //3. Generating Headers
  Map<String, String> _getHeaders(String urlEndpoint, {String body = ""}) {
    //generate a random string of length 16
    String salt = _getRandString(16);

    //calculating the unix timestamp in seconds
    String timestamp = (DateTime.now().toUtc().millisecondsSinceEpoch / 1000)
        .round()
        .toString();

    //generating the signature for the request according to the docs
    String signature =
        _getSignature("post", urlEndpoint, salt, timestamp, body);

    //Returning a map containing the headers and generated values
    return <String, String>{
      "access_key": _ACCESS_KEY,
      "signature": signature,
      "salt": salt,
      "timestamp": timestamp,
      "Content-Type": "application/json",
    };
  }

  //4. making post request
  Future<Map> createCheckoutPage() async {
    final responseURL = Uri.parse("$_BASEURL/v1/checkout");
    final String body = jsonEncode(_getBody());

    //making post request with headers and body.
    var response = await http.post(
      responseURL,
      headers: _getHeaders("/v1/checkout", body: body),
      body: body,
    );

    Map repBody = jsonDecode(response.body) as Map;
    //return data if request was successful
    if (response.statusCode == 200) {
      return repBody["data"] as Map;
    }

    //throw error if request was unsuccessful
    throw repBody["status"] as Map;
  }
}
