import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/util/app_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../ui/edit_page.dart';
import '../ui/tweet_detail.dart';

class TweetTile extends StatelessWidget {
  final int tweetId;
  final String username;
  final String userId;
  final String postTime;
  final String? content;

  const TweetTile(
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
      onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => TweetDetail(),
          )),
      contentPadding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: twitDarkGrey,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          PopupMenuButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0.5,
            itemBuilder: (popupCtx) {
              return [
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.delete_outlined),
                      Text('Delete Tweet'),
                    ],
                  ),
                  value: 1,
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.edit_outlined),
                      Text('Edit Tweet'),
                    ],
                  ),
                  value: 2,
                ),
              ];
            },
            onSelected: (value) {
              if (value == 1) {
              } else if (value == 2) {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => EditPage(),
                  ),
                );
              }
            },
            tooltip: 'More',
            icon: Icon(
              Icons.more_vert_outlined,
            ),
          ),
        ],
      ),
      visualDensity: VisualDensity.comfortable,
      subtitle: Column(
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
