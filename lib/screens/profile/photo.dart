import 'dart:io';
import 'package:achievoapp/screens/profile/widget/appbar.dart';
import 'package:achievoapp/screens/profile/widget/button.dart';
import 'package:achievoapp/screens/profile/widget/new_photo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/user_info.dart';
import '../../utils/preferences.dart';
import 'package:path_provider/path_provider.dart';

class EditPhotoPage extends StatefulWidget {
  const EditPhotoPage({Key? key}) : super(key: key);

  @override
  _EditPhotoPageState createState() => _EditPhotoPageState();
}

class _EditPhotoPageState extends State<EditPhotoPage> {
  late User user;
  File? newImage;
  final ImagePicker _picker = ImagePicker(); // ImagePicker değişkeni tanımla

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
                    final image = await _picker.pickImage(source: ImageSource.gallery); // _picker üzerinden getImage çağır
                    if (image == null) return;

                    final directory = await getApplicationDocumentsDirectory();
                    final name = File(image.path).path.split('/').last;
                    final imageFile = File('${directory.path}/$name');
                    newImage = await File(image.path).copy(imageFile.path);

                    setState(() {
                      user = user.copy(imagePath: newImage!.path);
                    });
                  },
                ),
                const SizedBox(height: 50),
                ButtonWidget(
                  text: 'Save',
                  onClicked: () {
                    if (newImage != null) {
                      newImage!.deleteSync();
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