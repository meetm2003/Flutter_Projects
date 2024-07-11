import 'package:flutter/material.dart';

class Assets extends StatefulWidget {
  const Assets({super.key});

  @override
  Assetstate createState() => Assetstate();
}

class Assetstate extends State<Assets> {
  final List<String> assets = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 205, 205, 205),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Assets",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 37,
                        color: Color.fromARGB(255, 41, 41, 41),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {}, 
                      style:  
                        ElevatedButton.styleFrom(
                          foregroundColor:const Color.fromARGB(255, 254, 91, 145),
                          backgroundColor: const Color.fromARGB(255, 254, 112, 112),
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      icon: const Icon(Icons.add),
                      label: const Text("Add Assets"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Expanded(
                child: 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
