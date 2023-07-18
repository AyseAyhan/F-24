import 'package:achievoapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Stack(
      alignment: Alignment.topLeft,
      children: [
        buildImage(),
        Positioned(
          top: 4,
          left: 8,
          child: buildEditIcon(color),
        ),
      ],
    );
  }

  Widget buildImage() {
    final image = imagePath.contains('https://')
        ? NetworkImage(imagePath)
        : FileImage(File(imagePath));

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        buildCircle(
          color: kSecondaryColor,
          all: 4,
          child: ClipOval(
            child: Material(
              color: Colors.red,
              child: Ink.image(
                image: image as ImageProvider,
                fit: BoxFit.cover,
                width: 128,
                height: 128,
                child: InkWell(onTap: onClicked),
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          left: 8,
          child: buildEditIcon(Colors.white),
        ),
      ],
    );
  }


  Widget buildEditIcon(Color color) => buildCircle(
    color: Colors.white,
    all: 3,
    child: buildCircle(
      color: kSecondaryColor,
      all: 8,
      child: Icon(
        isEdit ? Icons.add_a_photo : Icons.add_a_photo_outlined,
        color: Colors.white,
        size: 20,
      ),
    ),
  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}

