import 'package:flutter/material.dart';

class PhoneWidget extends StatelessWidget {
  final VoidCallback onClicked;
  final bool isEdit;

  const PhoneWidget({
    Key? key,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return IconButton(
      icon: const Icon(Icons.edit),
      color: Colors.blueGrey,
      onPressed: onClicked,
    );
  }
}