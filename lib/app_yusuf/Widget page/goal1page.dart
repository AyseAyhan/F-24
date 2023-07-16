import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/app/Goals/Repository%20of%20the%20Goals%20List.dart';

class goal1Page extends StatefulWidget {



  @override
  State<goal1Page> createState() => _goal1PageState();
}

class _goal1PageState extends State<goal1Page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goal Name'),
        // hedef adı repodan çekilecek
      ),
      body: Center(
        //asset eklencek
        // text eklencek
        child: Text(''),
      ),
    );
  }
}