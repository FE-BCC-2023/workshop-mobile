import 'package:flutter_application_1/repository/cahce_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Authrepository {
  final  _base_Url = "https://tweet-api.up.railway.app/api/v1";
  final  _client = http.Client();

  Future loginRepositiory(String email, String password) async {
    var uri = Uri.parse("$_base_Url/auth/login");

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
        

        print("send login data has sucess [auth_repository]");
        return true;
      } else {
        print("Register is fail [auth_repository] : ${response.body} ");
        
      }
    } catch (e) {
      print("Eror at Login [auth_repository]: ${e.toString()}");
      
    }

    return false;
  }

  Future registerRespository(String email, String password) async {
    var uri = Uri.parse("$_base_Url/auth/register");
    try {
      var response = await _client.post(uri,
          headers: {"content-type": "application/json"},
          body: json.encode({
            'email': email,
            'password': password,
          }));

      if (response.statusCode == 200) {
        print("Send Register data has sucess [auth_repository]");
        return true;
      } else {
        print("Register is fail [auth_repository] : ${response.body}");
      }
    } catch (e) {
      print("Eror at Regitser [auth_repository]: ${e.toString()}");
    }
    return false;
  }

  
}
