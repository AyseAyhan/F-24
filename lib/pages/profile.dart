import 'package:flutter/material.dart';
import 'package:F-24/pages/phone.dart';
import 'package:F-24/pages/photo.dart';
import '../model/user_info.dart';
import '../utils/preferences.dart';
import '../widget/new_about_user.dart';
import '../widget/new_email.dart';
import '../widget/new_name.dart';
import '../widget/new_phone.dart';
import '../widget/profile_widget.dart';
import 'about_user.dart';
import 'email.dart';
import 'name.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 80),
          const Text(
            'Edit Your ACHIEVO Profile',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.green, fontSize: 24, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 24),
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EditPhotoPage()),
              );
              setState(() {});
            },
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildEditButtons(),
              const SizedBox(width: 10),
              buildName(user),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildEditButtons() => Column(
    children: [
      NameWidget(
        onClicked: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => EditNamePage()),
          );
          setState(() {});
        },
      ),
      const SizedBox(height: 40),
      EmailWidget(
        onClicked: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => EditEmailPage()),
          );
          setState(() {});
        },
      ),
      const SizedBox(height: 35),
      PhoneWidget(
        onClicked: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => EditPhonePage()),
          );
          setState(() {});
        },
      ),
      const SizedBox(height: 35),
      AboutWidget(
        onClicked: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => EditAboutPage()),
          );
          setState(() {});
        },
      ),
      const SizedBox(height: 24),
    ],
  );

  Widget buildName(User user) => SizedBox(
    width: 300,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Name-Lastname',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 10),
        Text(
          '${user.firstname} ${user.lastname}',
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 10),
        buildDivider(),
        const SizedBox(height: 20),
        const Text(
          'Email Address',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 10),
        Text(
          user.email,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 10),
        buildDivider(),
        const SizedBox(height: 24),
        const Text(
          'Phone Number',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 10),
        Text(
          user.phone,
          style:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 10),
        buildDivider(),
        const SizedBox(height: 20),
        const Text(
          'Tell us about yourself!',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          user.about,
          maxLines: 4,
          softWrap: true,
          overflow: TextOverflow.clip,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 10),
        buildDivider(),
        const SizedBox(height: 20),
        const Text(
          // Placeholder text to add a bottom border
          'Quick Fix',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.transparent,
          ),
        ),
      ],
    ),
  );

  Widget buildDivider() => Container(
    height: .05,
    width: 350,
    color: Colors.grey,
    child: const Divider(),
  );
}