import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: const StadiumBorder(),
      foregroundColor: Colors.white,
      backgroundColor: Colors.green,
      padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 24),
    ),
    onPressed: onClicked,
    child: Text(text),
  );
}