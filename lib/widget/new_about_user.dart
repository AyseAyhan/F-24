import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AboutWidget extends StatelessWidget {
  final VoidCallback onClicked;
  final bool isEdit;

  const AboutWidget({
    Key? key,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Colors.grey;

    return IconButton(
      icon: const Icon(Icons.edit),
      color: Colors.blueGrey,
      onPressed: onClicked,
    );
  }
}