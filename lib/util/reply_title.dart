import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_color.dart';

class ReplyTile extends StatelessWidget {
  final int tweetId;
  final String username;
  final String userId;
  final String postTime;
  final String? content;

  const ReplyTile(
      {Key? key,
      required this.tweetId,
      required this.username,
      required this.userId,
      required this.postTime,
      this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: const EdgeInsets.fromLTRB(8, 5, 0, 0),
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: twitDarkGrey,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                userId,
                style: TextStyle(
                  color: twitDarkGrey,
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Container(
                width: 2,
                height: 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: twitDarkGrey,
                ),
              ),
              Text(
                postTime,
                style: TextStyle(
                  color: twitDarkGrey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 3),
          Text(
            'Replying to $userId',
            style: TextStyle(
              color: twitDarkGrey,
              fontSize: 14,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
      visualDensity: VisualDensity.comfortable,
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            content ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 9,
            softWrap: true,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: twitBlack,
              fontSize: 18,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.comment,
                  size: 16,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.retweet,
                  size: 16,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  size: 18,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share_outlined,
                  size: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
