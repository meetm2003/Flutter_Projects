import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testproject1/animatelogo.dart';
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
        color: Colors.white,
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     color: Colors.white,
        //     begin: Alignment.topRight,
        //     end: Alignment.bottomLeft,
        //   ),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedLogo(
              child: Image.asset(
                "assets/images/Animal_Welfare-1logo.png",
                height: 200,
                width: 200,
              ),
            ),
            // Text(
            //   "Splash Screen",
            //   style: TextStyle(
            //     // color: Color.fromARGB(255, 255, 243, 224),
            //     color: Color.fromARGB(255, 255, 243, 224),
            //     fontSize: 35,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
