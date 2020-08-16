import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null && _expiryDate.isAfter(DateTime.now())) {
      return _token;
    }
    return null;
  }

  Future<void> signup(
    String mobile,
    String password,
    String firstname,
    String lastname,
    String email,
  ) async {
    const url = 'http://10.0.2.2:3000/auth/signup';

    print(mobile);

    try {
      final response = await http.post(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: json.encode(
          {
            'mobile': int.parse(mobile),
            'password': password,
            'firstname': firstname,
            'email': email,
            'lastname': lastname,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['message']);
      }
    } catch (error) {
      throw error;
    }

    // print(json.decode(response.body));
  }

  Future<void> signin(String mobile, String password) async {
    const url = 'http://10.0.2.2:3000/auth/signin';
    try {
      final response = await http.post(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: json.encode({
          'mobile': int.parse(mobile),
          'password': password,
        }),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['message']);
      }
      final jwt = responseData['accessToken'];
      final user = json.decode(
        ascii.decode(
          base64.decode(
            base64.normalize(
              jwt.split(".")[1],
            ),
          ),
        ),
      );
      _token = jwt.toString();
      _userId = user['user_id'].toString();
      _expiryDate = new DateTime.fromMillisecondsSinceEpoch(user['exp'] * 1000);
      notifyListeners();
      print(user);
    } catch (error) {
      print("error caught");
      print(error);
      throw error;
    }
  }
}
