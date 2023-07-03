import 'package:flutter/material.dart';
import '../main.dart';
import '../model/user_info.dart';
import '../utils/preferences.dart';
import '../widget/appbar.dart';
import '../widget/button.dart';
import '../widget/textfield.dart';

class EditPhonePage extends StatefulWidget {
  const EditPhonePage({super.key});

  @override
  _EditPhonePageState createState() => _EditPhonePageState();
}

class _EditPhonePageState extends State<EditPhonePage> {
  User user = UserPreferences.getUser();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: buildAppBar(context),
    body: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(height: 24),
        Column(
          children: [
            TextFieldWidget(
              label: 'What is your phone number?',
              text: user.phone,
              onChanged: (phone) => user = user.copy(phone: phone),
            ),
            const SizedBox(height: 40),
            ButtonWidget(
              text: 'Save Phone Number',
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