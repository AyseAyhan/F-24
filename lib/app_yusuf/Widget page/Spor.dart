import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Widget page/Goal Setting Page.dart';

class sporEkrani extends StatefulWidget {
  const sporEkrani({Key? key}) : super(key: key);

  @override
  State<sporEkrani> createState() => _sporEkraniState();
}

class _sporEkraniState extends State<sporEkrani> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spor Hedefleri"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(''
              ),

            ],
          ),
        ),
      ),
    );
  }
}