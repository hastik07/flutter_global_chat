import 'package:flutter/material.dart';
import 'package:globalchat/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:globalchat/provider/user_provider.dart';
import 'package:globalchat/screens/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp()));
} 

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: 'Poppins',
            useMaterial3: true,
            brightness: Brightness.light),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }
}
