import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import '../model/user_info.dart';
import '../utils/preferences.dart';
import '../widget/appbar.dart';
import '../widget/button.dart';
import '../widget/new_photo.dart';

class EditPhotoPage extends StatefulWidget {
  const EditPhotoPage({super.key});

  @override
  _EditPhotoPageState createState() => _EditPhotoPageState();
}

class _EditPhotoPageState extends State<EditPhotoPage> {
  late User user;
  File? newImage;

  @override
  void initState() {
    super.initState();
    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: buildAppBar(context),
    body: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(height: 24),
        Column(
          children: [
            const Text(
              'Upload a Photo of Yourself',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            const SizedBox(height: 50),
            PhotoWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {
                final image = await ImagePicker().getImage(source: ImageSource.gallery);
                if (image == null) return;

                final directory = await getApplicationDocumentsDirectory();
                final name = File(image.path).path.split('/').last; // Updated line
                final imageFile = File('${directory.path}/$name');
                newImage = await File(image.path).copy(imageFile.path);

                setState(() {
                  user = user.copy(imagePath: newImage!.path); // Updated line
                });
              },
            ),
            const SizedBox(height: 50),
            ButtonWidget(
              text: 'Save',
              onClicked: () {
                if (newImage != null) {
                  newImage!.deleteSync(); // Delete the temporary image file
                }
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
