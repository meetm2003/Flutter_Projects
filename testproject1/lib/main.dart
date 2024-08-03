import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testproject1/firebase_options.dart';
import 'package:testproject1/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const SplashScreen(),
    ),
  );
}
