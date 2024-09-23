import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:globalchat/screens/splash_screen.dart';

class SignUpController {
  static Future<void> createAccount(
      {required BuildContext context,
      required String email,
      required String password,
      required String name,
      required String country}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      var userId = FirebaseAuth.instance.currentUser!.uid;
      var db = FirebaseFirestore.instance;
      Map<String, dynamic> data = {
        "name" : name,
        "country" : country,
        "email" : email,
        "id" : userId.toString()
      };
      try {
        await db.collection("users").doc(userId.toString()).set(data);
      }catch(e) {
        print(e);
      }
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => const SplashScreen()),
          (route) {
        return false;
      });
      SnackBar messageSnackBar = const SnackBar(
        content: Text('Account created Successfully'),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(messageSnackBar);
    } catch (e) {
      SnackBar messageSnackBar = SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(messageSnackBar);
    }
  }
}
