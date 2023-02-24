import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/repository/tweet_repository.dart';
import 'package:flutter_application_1/model/tweet_model.dart';

part 'tweet_event.dart';
part 'tweet_state.dart';

class TweetBloc extends Bloc<TweetEvent, TweetState> {
  final _tweetRepository = TweetRepository();
  TweetBloc() : super(TweetInitial()) {
    on<CreateTweet>((event, emit) async {
      emit(CreateTweetLoading());
      try {
        var response =
            await _tweetRepository.createTweet(event.title, event.description);

        response != null
            ? emit(CreateTweetSucess(tweetModel: response))
            : emit(CreateTweetEror("Get tweet has fail"));
      } catch (e) {
        emit(CreateTweetEror(e.toString()));
      }
    });


    on<GetTweet>((event, emit)  async{
      emit(GetTweetLoading());

      try {
        var reponse = await _tweetRepository.getAllTweet();

        reponse != null ? emit(GetTweetSucess(allTweet: reponse)) : emit(GetTweetHasNoData());
        
      } catch (e) {
        emit(GetTweetEror(e.toString()));
        
      }
      
    });

    on<UpdateTweet>((event, emit) async{
      emit(UpdateTweetLoading());
      try {
        var reponse = await _tweetRepository.updateTweet(event.tweetModel);

        reponse ? emit(UpdateTweetSucees()) : emit(UpdateTweetEror(eror: "Update tweet faild"));
      } catch (e) {
        emit(UpdateTweetEror(eror: e.toString()));
        
      }
    });

    on<DeleteTweet>((event, emit)  async{
      emit(DeleteTweetLoading());
      try {
        var response = await _tweetRepository.deleteTweet(event.tweetId);

        response ? emit(DeleteTweetSuccess()) : emit(DeleteTweetEror("Deletet Tweet Fail"));
      } catch (e) {
        emit(DeleteTweetEror(e.toString()));
        
      }
    });
  }

 
}
