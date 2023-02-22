import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/tweet/tweet_bloc.dart';
import 'package:flutter_application_1/util/reuse_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../util/app_color.dart';
import '../util/twit_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<TweetBloc>().add(GetTweet());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<TweetBloc>().add(GetTweet());
        },
        child: BlocConsumer<TweetBloc, TweetState>(
          listener: (context, state) {
            if(state is GetTweetEror){
              ReuseableWidget.showSnackBar(context, state.eror);
            }
          },
          builder: (context, state) {
            if(state is GetTweetLoading){
              return const Scaffold(body: Center(child: CircularProgressIndicator(),),);
            }
            if(state is GetTweetSucess){
              return ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  height: 0.5,
                  color: twitGrey.withOpacity(0.75),
                );
              },
              itemCount: state.allTweet.length,
              itemBuilder: (listViewCtx, index) {
                return TweetTile(
                  tweetId: state.allTweet[index].id,
                  userId: state.allTweet[index].userId.toString(),
                  username: 'username',
                  postTime: state.allTweet[index].createdAt.toIso8601String(),
                  content: state.allTweet[index].description,
                );
              },
            );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
