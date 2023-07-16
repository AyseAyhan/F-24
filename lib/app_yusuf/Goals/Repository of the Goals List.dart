import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled6/app/Goals/Spor%20page%20repo.dart';
import 'package:untitled6/app/Widget%20page/Goal%20Setting%20Page.dart';
import 'package:untitled6/app/Widget%20page/HomePage.dart';

import '../Widget page/HomePage.dart';

class repositoryOfTheList extends StatefulWidget {
  repositoryOfTheList(TextEditingController hedefTanimla);

  
 
  @override
  State<repositoryOfTheList> createState() => _repositoryOfTheListState();
}

class _repositoryOfTheListState extends State<repositoryOfTheList> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(''),
          TextButton(
              onPressed: (){
                {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) {
                            return MyHomePage(title: '',);
                          }
                      )
                  );
                }
              }
              ,
              child: Text('Ana Ekrana Dön'))
        ],
      ),
      
    );
  }
}





