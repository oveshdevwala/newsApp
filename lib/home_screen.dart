// ignore_for_file: must_be_immutable

import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constrains/theme/colors.dart';
import 'package:news_app/features/bookmark/screens/bookmark.dart';
import 'package:news_app/features/discover/screen/discover.dart';
import 'package:news_app/features/home_feed/screen/home_feed.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var screenIndex = 0;
  List<Widget> naviagtionsScreens = [
    const HomeFeed(),
    const DicoverScreen(),
    const Bookmark(),
  ];
  var myPageContorller = PageController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          backgroundColor: UiColors.btBlue,
        ),
        // appBar: MyHomeAppbar(),
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
            ],
            onTabChangedListener: (position, title, tabColor) {
              screenIndex = position;
              setState(() {});
            },
          ),
        ),
        body: IndexedStack(
          index: screenIndex,
          children: naviagtionsScreens,
        ));
  }
}
