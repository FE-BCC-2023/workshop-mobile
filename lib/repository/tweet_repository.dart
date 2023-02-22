import 'dart:convert';
import 'package:flutter_application_1/model/tweet_model.dart';
import 'package:flutter_application_1/repository/cahce_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

Future<String> getToken() async {
  var token = await Cache.getData("token_user");
  return token;
}

class TweetRepository {
  final _baseUrl = "https://tweet-api.up.railway.app/api/v1";
  final _client = http.Client();

  Future<TweetModel?> createTweet(String title, String description) async {
    final token = await getToken();

    var uri = Uri.parse("$_baseUrl/tweet/create");
    try {
      var response = await _client.post(uri,
          headers: {
            "Authorization": "Bearer $token",
            'Content-Type': 'application/json',
            'Accept': '*/*',
          },
          body: json.encode({
            'title': title,
            'description': description,
          }));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        TweetModel tweet = TweetModel.fromJson(data['data']);

        return tweet;
      } else {
        print("createTweet is fail [tweet_repository] : ${response.body}");
      }
    } catch (e) {
      print("craeteTweet eror ${e.toString()}");
    }
    return null;
  }

  Future getAllTweet() async {
    final token = await getToken();

    var uri = Uri.parse("$_baseUrl/tweet/all");

    try {
      var response = await _client.get(
        uri,
        headers: {
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        List<TweetModel> allTweet = (data['data'] as List<dynamic>)
            .map((e) => TweetModel.fromJson(e))
            .toList();

        return allTweet;
      }
       else {
        print("getAllTweet has fail [tweet_repository] : ${response.body}");
       }
    } catch (e) {
      print("GetAllTwet eror [tweet_repositoiry] : ${e.toString()}");
    }
    return null;
  }
}
