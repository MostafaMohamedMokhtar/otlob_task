import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:otlob_task/helpers/base_url.dart';

final authProvider = ChangeNotifierProvider<Authentication>((ref) {
  return Authentication();
});
class Authentication extends ChangeNotifier{
    bool _isAuth = false ;
  bool get isAuth {
    return _isAuth ;
  }
  Future<String> login(String mobile, String password) async {
    final Response response = await post(Uri.parse(Urls.api + 'login'),
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
        body: json.encode({
          "access_key": "Gdka52DASWE3DSasWE742Wq",
          "access_password": "yH52dDDF85sddEWqPNV7D12sW5e",
          "mobile": mobile,
          "password": password,
        }));
    print('response = $response');
    try {
      if (response.statusCode > 403) {
        throw Exception('an error occurred');
      }
      final parsed = json.decode(response.body).cast<String, dynamic>();
      if (parsed['message'] == "Invalid Account" ||
          parsed['message'] == "Invalid Credintials") {
        return parsed['message'];
      }
      if (response.statusCode == 200) {
        print('parsed = $parsed');
        print('logIn parsed data = ${parsed['return']}');
        _isAuth = true ;
       // notifyListeners();
        return 'Authanticated';
      }
    } // end try
    catch (e) {
      print(e);
      return e ;
    }
  } // end getLoginData()
}