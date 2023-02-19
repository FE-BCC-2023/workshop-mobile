import 'package:flutter/material.dart';

import '../util/app_color.dart';
import '../util/twit_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: RefreshIndicator(
        onRefresh: () async {},
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 0.5,
              color: twitGrey.withOpacity(0.75),
            );
          },
          itemCount: 3,
          itemBuilder: (listViewCtx, index) {
            return TweetTile(
              tweetId: 1,
              userId: ' @user ',
              username: 'Username',
              postTime: ' 10m',
              content: 'Flutter & Flame: Effects and ads published by '
                  '@RealDevOwl in \n#FlutterCommunity '
                  '\n\nmedium.com/flutter-community/flutter-flame'
                  '-effects-and-ads-3e243009d18c '
                  '\n\ncc:  #Flutter @nlycskn \n@r_FlutterDev',
            );
          },
        ),
      ),
    );
  }
}
