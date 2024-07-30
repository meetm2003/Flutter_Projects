import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testproject1/custompageroute.dart';
import 'package:testproject1/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  stateSplashScreen createState() => stateSplashScreen();
}

// ignore: camel_case_types
class stateSplashScreen extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).push(
        Custompageroute(child: const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 168, 213, 186),
              Color.fromARGB(255, 179, 229, 252),
              Color.fromARGB(255, 255, 255, 255),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Splash Screen",
              style: TextStyle(
                // color: Color.fromARGB(255, 255, 243, 224),
                color: Color.fromARGB(255, 255, 243, 224),
                fontSize: 35,
              ),
            )
          ],
        ),
      ),
    );
  }
}
