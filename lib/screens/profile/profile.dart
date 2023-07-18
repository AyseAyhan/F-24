import 'package:achievoapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:achievoapp/screens/profile/phone.dart';
import 'package:achievoapp/screens/profile/photo.dart';
import 'package:achievoapp/screens/profile/widget/new_about_user.dart';
import 'package:achievoapp/screens/profile/widget/new_email.dart';
import 'package:achievoapp/screens/profile/widget/new_name.dart';
import 'package:achievoapp/screens/profile/widget/new_phone.dart';
import 'package:achievoapp/screens/profile/widget/profile_widget.dart';
import '../../models/user_info.dart';
import '../../utils/preferences.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 18,),
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 30),
          const Text(
            'ACHIEVO Profilini Düzenle',
            textAlign: TextAlign.left,
            style: TextStyle(color: kSecondaryColor, fontSize: 24, fontStyle: FontStyle.italic),
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
    width: 250,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Adı-Soyadı',
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
          'E-posta adresi',
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
          'Telefon Numarası',
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
          'Bize kendinden bashet! ',
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
          'Hızlı Düzeltme',
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