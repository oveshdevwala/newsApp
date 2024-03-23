// ignore_for_file: must_be_immutable

import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constrains/widgets/colors.dart';

class MyBottomNavigation extends StatefulWidget {
  MyBottomNavigation({super.key, setState});
  dynamic setState;
  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  var screenIndex = 0;
  @override
  Widget build(BuildContext context) {
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
          widget.setState(() {});
        },
      ),
    );
  }
}





// class MyBottomNavigation extends StatefulWidget {
//   const MyBottomNavigation({super.key});

//   @override
//   State<MyBottomNavigation> createState() => _MyBottomNavigationState();
// }

// class _MyBottomNavigationState extends State<MyBottomNavigation> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 80,
//       child: StylishBottomBar(
//           currentIndex: selctedIndex,
//           onTap: (index) {
//             selctedIndex = index;
//             setState(() {});
//           },
//           items: [
//             BottomBarItem(
//                 selectedIcon: Icon(
//                   CupertinoIcons.home,
//                   color: UiColors.white,
//                 ),
//                 icon: const Icon(
//                   CupertinoIcons.home,
//                 ),
//                 title: Text(
//                   "Home",
//                   style: TextStyle(color: UiColors.white),
//                 ),
//                 backgroundColor: UiColors.textBlue),
//             BottomBarItem(
//                 icon: const Icon(CupertinoIcons.globe),
//                 title: const Text("Discover")),
//             BottomBarItem(
//                 icon: const Icon(CupertinoIcons.bookmark),
//                 title: const Text("Bookmark")),
//             BottomBarItem(
//                 icon: const Icon(CupertinoIcons.person),
//                 title: const Text("Profile")),
//           ],
//           option: BubbleBarOptions(
//               borderRadius: BorderRadius.circular(18),
//               barStyle: BubbleBarStyle.horizotnal,
//               padding: const EdgeInsets.all(0),
//               inkEffect: true,
//               unselectedIconColor: UiColors.iconGrey,
//               bubbleFillStyle: BubbleFillStyle.fill)),
//     );
//   }
// }

// class MyBottomNavigation extends StatefulWidget {
//   const MyBottomNavigation({super.key});

//   @override
//   State<MyBottomNavigation> createState() => _MyBottomNavigationState();
// }

// class _MyBottomNavigationState extends State<MyBottomNavigation> {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//         showSelectedLabels: false,
//         onTap: (value) {
//           selctedIndex = value;
//           setState(() {});
//         },
//         landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
//         currentIndex: selctedIndex,
//         items: [
//           BottomNavigationBarItem(
//               backgroundColor: UiColors.white,
//               icon: Icon(
//                 CupertinoIcons.home,
//                 color: UiColors.iconGrey,
//               ),
//               activeIcon: Container(
//                 color: Colors.blueAccent.shade200,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       CupertinoIcons.home,
//                       color: UiColors.black,
//                     ),
//                     const SizedBox(width: 5),
//                     const Text('Home')
//                   ],
//                 ),
//               ),
//               label: 'Home'),
//           BottomNavigationBarItem(
//               activeIcon: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     CupertinoIcons.globe,
//                     color: UiColors.black,
//                   ),
//                   const FittedBox(child: Text('Dicover'))
//                 ],
//               ),
//               icon: Icon(
//                 CupertinoIcons.globe,
//                 color: UiColors.iconGrey,
//               ),
//               label: "Discover"),
//           BottomNavigationBarItem(
//               activeIcon: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     CupertinoIcons.bookmark,
//                     color: UiColors.black,
//                   ),
//                   const SizedBox(width: 5),
//                   const Text('Home')
//                 ],
//               ),
//               icon: Icon(
//                 CupertinoIcons.bookmark,
//                 color: UiColors.iconGrey,
//               ),
//               label: 'Bookmark'),
//           BottomNavigationBarItem(
//               activeIcon: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     CupertinoIcons.person,
//                     color: UiColors.black,
//                   ),
//                   const SizedBox(width: 5),
//                   const Text('Profile')
//                 ],
//               ),
//               icon: Icon(
//                 CupertinoIcons.person,
//                 color: UiColors.iconGrey,
//               ),
//               label: 'Profile'),
//         ]);
//   }
// }
