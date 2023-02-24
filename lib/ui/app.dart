import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/search_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../util/app_color.dart';
import '../util/twt_drawer.dart';
import 'compose.dart';
import 'homa_page.dart';
import 'mesages_page.dart';
import 'notification_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: twitWhite,
      drawer: TwitDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: twitWhite,
        elevation: 1,
        centerTitle: true,
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: twitBlue,
        ),
        actions: [
          _pageIndex != 0
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings_outlined,
                    color: Colors.black,
                  ),
                )
              : Container()
        ],
      ),
      body: _pageIndex == 0
          ? HomePage()
          : _pageIndex == 1
              ? SearchPage()
              : _pageIndex == 2
                  ? NotificationsPage()
                  : MessagesPage(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Compose())),
          elevation: 1,
          backgroundColor: twitBlue,
          child: Icon(
            Icons.add,
            color: twitWhite,
          )),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 1.5,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _pageIndex == 0 ? Icons.home : Icons.home_outlined,
              color: Colors.black,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _pageIndex == 1 ? Icons.search : Icons.search_outlined,
              color: Colors.black,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _pageIndex == 2
                  ? Icons.notifications
                  : Icons.notifications_outlined,
              color: Colors.black,
            ),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _pageIndex == 3 ? Icons.mail : Icons.mail_outline,
              color: Colors.black,
            ),
            label: "Messages",
          ),
        ],
      ),
    );
  }
}
