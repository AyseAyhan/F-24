//import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; //uyari masaji icin kullanilir
import '../../screens/home_screen.dart';

class AuthService 
{
  final userCollection = FirebaseFirestore.instance.collection("users");
  final firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp(BuildContext context, {required String name, required String email, required String password}) async {
    final navigator = Navigator.of(context);
    try {
      final UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null )  { //kullanıcı kayit oldu mu olmadi mi
        await _registerUser(name: name, email: email, password: password);
        navigator.push(MaterialPageRoute(builder: (context) => HomeScreen(),));
      }
    } on FirebaseAuthException catch (e) { //hata mesaji
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }

  //giris yapma islemi
  Future<void> signIn(BuildContext context, {required String email, required String password}) async 
  {
    final navigator = Navigator.of(context); //async oldugu icin burada belirttik
    try 
    {
      final UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) 
      {
        navigator.push(MaterialPageRoute(builder: (context) => HomeScreen(),));
      }
    } on FirebaseAuthException catch(e) 
    {
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }

  //kayit islemi
  Future<void> _registerUser({required String name, required String email, required String password}) async 
  {
    await userCollection.doc().set({
      "email" : email,
      "name": name,
      "password": password
    });
  }

  //cikis yap fonk
  signOut() async
  {
    return await firebaseAuth.signOut();
  }

}