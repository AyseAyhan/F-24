import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  //final icon = CupertinoIcons.moon_stars;

  IconData? icon;
  return AppBar(
    leading: const BackButton(),
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: Colors.transparent,
    actions: [
      IconButton(
        icon: Icon(icon),
        onPressed: () {},
      ),
    ],
  );
}
