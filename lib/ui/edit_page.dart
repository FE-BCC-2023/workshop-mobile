import 'package:flutter/material.dart';
import 'package:flutter_application_1/util/reuse_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_application_1/bloc/tweet/tweet_bloc.dart';
import 'package:flutter_application_1/model/tweet_model.dart';

import '../util/app_color.dart';
import 'app.dart';

class EditPage extends StatefulWidget {
  TweetModel tweetModel;
  EditPage({
    Key? key,
    required this.tweetModel,
  }) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _tweetInputController = TextEditingController();

  bool isValid = false;

  @override
  void initState() {
    _tweetInputController.text = widget.tweetModel.description!;
    super.initState();
  }

  @override
  void dispose() {
    _tweetInputController.dispose();
    super.dispose();
  }

  inputCheck() {
    if (_tweetInputController.text.isNotEmpty) {
      setState(() {
        isValid = true;
        widget.tweetModel.description = _tweetInputController.text;
      });
    } else {
      setState(() {
        isValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: twitWhite,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        elevation: 1,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: twitBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 0,
              ),
              onPressed: isValid
                  ? () {
                      context
                          .read<TweetBloc>()
                          .add(UpdateTweet(tweetModel: widget.tweetModel));
                    }
                  : null,
              child: Text(
                "Edit Tweet",
                style: TextStyle(color: twitWhite),
              ),
            ),
          )
        ],
      ),
      body: BlocConsumer<TweetBloc, TweetState>(
        listener: (context, state) {
          if(state is UpdateTweetSucees){
            Navigator.pushReplacement(context, MaterialPageRoute(builder:(_)=> const App()));
          } else if( state is UpdateTweetEror){
            ReuseableWidget.showSnackBar(context, state.eror);
          }
        },
        builder: (context, state) {
          if(state is UpdateTweetLoading){
            return const Center(child: CircularProgressIndicator(),);
          }
          return Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: twitDarkGrey,
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: TextField(
                              controller: _tweetInputController,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'What\'s happening?',
                                  hintStyle: TextStyle(fontSize: 16)),
                              onChanged: (value) => inputCheck(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.transparent,
                        splashFactory: NoSplash.splashFactory,
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.globeAsia,
                            color: twitBlue,
                            size: 16,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "Everyone can reply",
                            style: TextStyle(
                              color: twitBlue,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.image_outlined),
                    color: twitBlue,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.gif_outlined),
                    color: twitBlue,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.poll_outlined),
                    color: twitBlue,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.pin_drop_outlined),
                    color: twitBlue,
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
