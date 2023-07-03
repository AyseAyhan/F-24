import 'package:flutter/material.dart';
import '../model/user_info.dart';
import '../utils/preferences.dart';
import '../widget/appbar.dart';
import '../widget/button.dart';
import '../widget/textfield.dart';

class EditAboutPage extends StatefulWidget {
  const EditAboutPage({super.key});

  @override
  _EditAboutPageState createState() => _EditAboutPageState();
}

class _EditAboutPageState extends State<EditAboutPage> {
  User user = UserPreferences.getUser();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: buildAppBar(context),
    body: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(height: 28),
        Column(
          children: [
            TextFieldWidget(
              label: 'About',
              text: user.about,
              maxLines: 4,
              onChanged: (about) => user = user.copy(about: about),
            ),
            const SizedBox(height: 40),
            ButtonWidget(
              text: 'Save',
              onClicked: () {
                UserPreferences.setUser(user);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ],
    ),
  );
}
