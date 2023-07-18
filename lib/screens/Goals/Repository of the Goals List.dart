import 'package:achievoapp/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                            return HomeScreen(title: '',);
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





