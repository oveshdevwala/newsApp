import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constrains/widgets/colors.dart';
import 'package:news_app/constrains/widgets/widgets.dart';

AppBar myHomeAppBar(
    BuildContext context, GlobalKey<ScaffoldState> _scaffoldKey) {
  return AppBar(
    backgroundColor: UiColors.btBlue,
    leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: myIconButton(
            onTap: () {
              // Scaffold.of(context).openDrawer();
              _scaffoldKey.currentState?.openDrawer();
            },
            iconColor: UiColors.btBlue,
            btIcon: Icons.menu)),
    elevation: 0,
    actions: [
      myIconButton(
          btIcon: CupertinoIcons.search,
          onTap: () {},
          iconColor: UiColors.bgBlue),
      const SizedBox(width: 3),
      myIconButton(
          btIcon: CupertinoIcons.bell,
          onTap: () {},
          iconColor: UiColors.btBlue),
      const SizedBox(width: 10)
    ],
  );
}
