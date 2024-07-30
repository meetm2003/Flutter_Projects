import 'package:flutter/material.dart';
import 'package:testproject1/splash_screen.dart';

void main() => runApp(
  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const SplashScreen(),
    )
);