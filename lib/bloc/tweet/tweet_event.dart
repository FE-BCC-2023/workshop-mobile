part of 'tweet_bloc.dart';

@immutable
abstract class TweetEvent {}

class CreateTweet extends TweetEvent{
  final String title;
  final String description;

  CreateTweet(this.title, this.description);

}

class GetTweet extends TweetEvent{}
