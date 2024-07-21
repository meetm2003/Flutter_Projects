import 'package:flutter/material.dart';
import 'package:asset_management/login_scr.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScr(),
    );
  }
}