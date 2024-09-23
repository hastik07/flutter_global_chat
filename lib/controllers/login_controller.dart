import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:globalchat/screens/splash_screen.dart';

class LoginController {
  static Future<void> loginAccount(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => const SplashScreen()),
          (route) {
        return false;
      });
      SnackBar messageSnackBar = const SnackBar(
        content: Text('Login Successfully!'),
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
