import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../util/app_color.dart';

class Compose extends StatefulWidget {
  @override
  State<Compose> createState() => _ComposeState();
}

class _ComposeState extends State<Compose> {
  final _tweetInputController = TextEditingController();
  bool isValid = false;

  @override
  void dispose() {
    _tweetInputController.dispose();
    super.dispose();
  }

  inputCheck() {
    if (_tweetInputController.text.isNotEmpty) {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: twitWhite,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close),
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
              onPressed: isValid ? () {} : null,
              child: Text(
                "Tweet",
                style: TextStyle(color: twitWhite),
              ),
            ),
          )
        ],
      ),
      body: Column(
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
      ),
    );
  }
}
