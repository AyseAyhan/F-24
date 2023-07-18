import 'package:flutter/material.dart';
import 'dart:io';

class PhotoWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const PhotoWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Colors.black;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          if (isEdit) Positioned(
            top: 0,
            right: 0,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = imagePath.contains('https://')
        ? NetworkImage(imagePath)
        : FileImage(File(imagePath));

    return buildRectangle(
      color: Colors.black,
      all: 4,
      child: ClipRect(
        child: Material(
          color: Colors.black,
          child: Ink.image(
            image: image as ImageProvider,
            fit: BoxFit.cover,
            width: 350,
            height: 350,
            child: InkWell(onTap: onClicked),
          ),
        ),
      ),
    );
  }

  Widget buildRectangle({
    required Color color,
    required double all,
    required Widget child,
  }) =>
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(all),
          color: color,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: child,
      );

  Widget buildEditIcon(Color color) => ClipOval(
    child: Material(
      color: color, // button color
      child: InkWell(
        splashColor: Colors.white,
        onTap: onClicked, // inkwell color
        child: const SizedBox(
          width: 40,
          height: 40,
          child: Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
