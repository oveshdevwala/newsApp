import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constrains/widgets/colors.dart';
import 'package:news_app/features/screen/bookmark/bookmark.dart';
import 'package:news_app/features/screen/discover/discover.dart';
import 'package:news_app/features/screen/home_feed/home_feed.dart';
import 'package:news_app/features/screen/profile/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var screenIndex = 0;
  List<Widget> naviagtionsScreens = [
    HomeFeed(),
    const DicoverScreen(),
    const Bookmark(),
    const ProfileScreen(),
  ];
  var myPageContorller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SizedBox(
          height: 70,
          child: CubertoBottomBar(
            tabStyle: CubertoTabStyle.styleNormal,
            selectedTab: screenIndex,
            inactiveIconColor: UiColors.bgBlue,
            tabColor: Colors.black,
            textColor: UiColors.white,
            tabs: [
              TabData(iconData: CupertinoIcons.home, title: 'Home'),
              TabData(iconData: CupertinoIcons.globe, title: 'Discover'),
              TabData(iconData: CupertinoIcons.bookmark, title: 'Bookmark'),
              TabData(iconData: CupertinoIcons.person, title: 'Profile'),
            ],
            onTabChangedListener: (position, title, tabColor) {
              screenIndex = position;
              setState(() {});
            },
          ),
        ),
        body: naviagtionsScreens[screenIndex]);
  }

  SizedBox bottomNavigation(setState) {
    return SizedBox(
      height: 70,
      child: CubertoBottomBar(
        tabStyle: CubertoTabStyle.styleNormal,
        selectedTab: screenIndex,
        inactiveIconColor: UiColors.bgBlue,
        tabColor: Colors.black,
        textColor: UiColors.white,
        tabs: [
          TabData(iconData: CupertinoIcons.home, title: 'Home'),
          TabData(iconData: CupertinoIcons.globe, title: 'Discover'),
          TabData(iconData: CupertinoIcons.bookmark, title: 'Bookmark'),
          TabData(iconData: CupertinoIcons.person, title: 'Profile'),
        ],
        onTabChangedListener: (position, title, tabColor) {
          screenIndex = position;
          setState(() {});
        },
      ),
    );
  }
}
