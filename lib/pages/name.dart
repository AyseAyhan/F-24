import 'package:flutter/material.dart';
import '../model/user_info.dart';
import '../utils/preferences.dart';
import '../widget/appbar.dart';
import '../widget/button.dart';
import '../widget/textfield.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key});

  @override
  _EditNamePageState createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  User user = UserPreferences.getUser();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: buildAppBar(context),
    body: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(height: 24),
        Column(
          children: [
            TextFieldWidget(
              label: 'What is Your Name?',
              text: user.firstname,
              onChanged: (firstname) => user = user.copy(firstname: firstname),
            ),
            TextFieldWidget(
              label: '',
              text: user.lastname,
              onChanged: (lastname) => user = user.copy(lastname: lastname),
            ),
            const SizedBox(height: 50),
            ButtonWidget(
              text: 'Save Name',
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
