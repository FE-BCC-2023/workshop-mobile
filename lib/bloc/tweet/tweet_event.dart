part of 'tweet_bloc.dart';

abstract class TweetEvent {}

class CreateTweet extends TweetEvent{
  final String title;
  final String description;

  CreateTweet(this.title, this.description);

}

class GetTweet extends TweetEvent{}

class UpdateTweet extends TweetEvent {
  TweetModel tweetModel;
  UpdateTweet({
    required this.tweetModel,
  });
}


class DeleteTweet extends TweetEvent {
  int tweetId;
  DeleteTweet({
    required this.tweetId,
  });
}


