import 'package:flutter_application_1/repository/cahce_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Authrepository {
  final _baseUrl = "https://tweet-api.up.railway.app/api/v1";
  final _client = http.Client();

  Future loginRepositiory(String email, String password) async {
    var uri = Uri.parse("$_baseUrl/auth/login");

    try {
      var response = await _client.post(uri,
          headers: {"content-type": "application/json"},
          body: json.encode({
            'email': email,
            'password': password,
          }));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        await Cache.writeData(key: 'token_user', value: data['token']['token']);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw (Exception("Eror at Login [auth_repository]: ${e.toString()}"));
    }
  }

  Future registerRespository(String email, String password) async {
    var uri = Uri.parse("$_baseUrl/auth/register");
    try {
      var response = await _client.post(uri,
          headers: {"content-type": "application/json"},
          body: json.encode({
            'email': email,
            'password': password,
          }));

      return response.statusCode == 200 ? true : false;
    } catch (e) {
      throw Exception("Eror at Regitser [auth_repository]: ${e.toString()}");
    }
  }
}
