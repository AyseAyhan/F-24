import 'package:achievoapp/utils/constants.dart';
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
      backgroundColor: kSecondaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 24),
    ),
    onPressed: onClicked,
    child: Text(text,style: TextStyle(fontSize: 20),),
  );
}