import 'dart:convert';
import 'package:flutter_application_1/model/tweet_model.dart';
import 'package:flutter_application_1/repository/cahce_repository.dart';
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
        return null;
      }
    } catch (e) {
      throw Exception("craeteTweet eror ${e.toString()}");
    }
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

        if (data['data'] != null) {
          List<TweetModel> allTweet = (data['data'] as List<dynamic>)
              .map((e) => TweetModel.fromJson(e))
              .toList();

          return allTweet;
        }
      } else {
        return null;
        
      }
      
    } catch (e) {
      throw Exception("GetAllTwet eror [tweet_repositoiry] : ${e.toString()}");
    }
  }

  Future updateTweet(TweetModel tweetModel) async {
    var uri = Uri.parse("$_baseUrl/tweet/update");
    final token = await getToken();

    try {
      var response = await _client.put(uri,
          headers: {
            "Authorization": "Bearer $token",
            'Content-Type': 'application/json',
            'Accept': '*/*',
          },
          body: json.encode({
            'title': 'tweet aku',
            'description': tweetModel.description,
            'id': tweetModel.id
          }));

          return response.statusCode == 200 ? true : false;

      
    } catch (e) {
      throw Exception("Eror at updatetweet [tweet_repository] : ${e.toString()}");
    }
    
  }

  Future deleteTweet(int tweetId) async {
    var uri = Uri.parse("$_baseUrl/tweet/delete");
    final token = await getToken();

    try {
      var response = await _client.delete(uri, headers: {
        "Authorization": "Bearer $token",
      }, body: {
        'id': tweetId.toString(),
      });

      return response.statusCode == 200 ? true : false;

    } catch (e) {
      throw Exception("Eror at delete tweet : ${e.toString()}");
    }
 
  }
}
