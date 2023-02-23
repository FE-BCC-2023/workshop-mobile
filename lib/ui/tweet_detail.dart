import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/tweet/tweet_bloc.dart';
import 'package:flutter_application_1/ui/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_application_1/model/tweet_model.dart';

import '../util/app_color.dart';
import '../util/reply_title.dart';
import 'edit_page.dart';

class TweetDetail extends StatefulWidget {
  TweetModel tweetmodel;
  TweetDetail({
    Key? key,
    required this.tweetmodel,
  }) : super(key: key);

  @override
  _TweetDetailState createState() => _TweetDetailState();
}

class _TweetDetailState extends State<TweetDetail> {
  final _replyInputController = TextEditingController();
  bool isValid = false;

  @override
  void dispose() {
    _replyInputController.dispose();
    super.dispose();
  }

  inputCheck() {
    if (_replyInputController.text.isNotEmpty) {
      setState(() {
        isValid = true;
      });
    } else {
      setState(() {
        isValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: twitWhite,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: twitWhite,
        title: Text(
          'Tweet',
          style: TextStyle(
            color: twitBlack,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_rounded,
            color: twitBlack,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: deviceHeight,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 26,
                                    backgroundColor: twitDarkGrey,
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Username',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        softWrap: true,
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        '${widget.tweetmodel.userId}',
                                        style: TextStyle(
                                          color: twitDarkGrey,
                                          fontSize: 14,
                                        ),
                                        softWrap: true,
                                      ),
                                    ],
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.delete_outlined),
                                          Text('Delete Tweet'),
                                        ],
                                      ),
                                      value: 1,
                                      onTap: () {
                                        context.read<TweetBloc>().add(DeleteTweet(tweetId: widget.tweetmodel.id));
                                        Navigator.push(context, MaterialPageRoute(builder: (_)=> const App()));
                                      },
                                    ),
                                    PopupMenuItem(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                        builder: (_) => EditPage(tweetModel: widget.tweetmodel),
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
                          SizedBox(height: 5),
                          Text(
                            widget.tweetmodel.description,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            softWrap: true,
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                '10:35 ',
                                style: TextStyle(
                                  color: twitDarkGrey,
                                  fontSize: 14,
                                ),
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
                                ' 22 Jan 22 ',
                                style: TextStyle(
                                  color: twitDarkGrey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Divider(
                            height: 3,
                            color: twitGrey,
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: FaIcon(
                                  FontAwesomeIcons.comment,
                                  size: 20,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: FaIcon(
                                  FontAwesomeIcons.retweet,
                                  size: 20,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border,
                                  size: 22,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.share_outlined,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Divider(
                            height: 3,
                            color: twitGrey,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 0.5,
                            color: twitGrey.withOpacity(0.75),
                          );
                        },
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (listViewCtx, index) {
                          return ReplyTile(
                            tweetId: 3,
                            userId: ' @user1 ',
                            username: 'Username 1',
                            postTime: ' 5m',
                            content: 'Nice!!',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: twitWhite,
                  boxShadow: [
                    BoxShadow(
                      color: twitGrey,
                      blurRadius: 1.5,
                      blurStyle: BlurStyle.outer,
                      offset: Offset(0, -1),
                      spreadRadius: 1.5,
                    )
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _replyInputController,
                        decoration: InputDecoration(
                          hintText: 'Tweet your reply',
                        ),
                        onChanged: (value) => inputCheck(),
                      ),
                    ),
                    Material(
                      child: IconButton(
                        onPressed: isValid ? () {} : null,
                        icon: Icon(
                          Icons.send_outlined,
                          color: isValid ? twitBlue : twitBlue.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


