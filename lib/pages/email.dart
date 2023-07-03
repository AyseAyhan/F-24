import 'package:flutter/material.dart';
import '../model/user_info.dart';
import '../utils/preferences.dart';
import '../widget/appbar.dart';
import '../widget/button.dart';
import '../widget/textfield.dart';
class EditEmailPage extends StatefulWidget {
  const EditEmailPage({super.key});

  @override
  _EditEmailPageState createState() => _EditEmailPageState();
}

class _EditEmailPageState extends State<EditEmailPage> {
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
              label: 'What is your Email?',
              text: user.email,
              onChanged: (email) => user = user.copy(email: email),
            ),
            const SizedBox(height: 40),
            ButtonWidget(
              text: 'Save Email',
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
