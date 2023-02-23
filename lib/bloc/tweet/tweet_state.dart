part of 'tweet_bloc.dart';

abstract class TweetState {}

class TweetInitial extends TweetState {}

class CreateTweetLoading extends TweetState {}

class CreateTweetSucess extends TweetState {
  TweetModel tweetModel;
  CreateTweetSucess({
    required this.tweetModel,
  });
}

class CreateTweetEror extends TweetState {
  final String eror;

  CreateTweetEror(this.eror);
}

class GetTweetLoading extends TweetState {}

class GetTweetSucess extends TweetState {
  List<TweetModel> allTweet;
  GetTweetSucess({
    required this.allTweet,
  });
}

class GetTweetEror extends TweetState {
  final String eror;

  GetTweetEror(this.eror);
}

class UpdateTweetSucees extends TweetState {}

class UpdateTweetEror extends TweetState {
  final String eror;
  UpdateTweetEror({
    required this.eror,
  });
}

class UpdateTweetLoading extends TweetState {}

class DeleteTweetLoading extends TweetState {}

class DeleteTweetEror extends TweetState {
  final String eror;

  DeleteTweetEror(this.eror);
}

class DeleteTweetSuccess extends TweetState {}
