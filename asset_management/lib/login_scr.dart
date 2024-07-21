import 'package:asset_management/assets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

class LoginScr extends StatefulWidget {
  const LoginScr({super.key});

  @override
  LoginScrState createState() => LoginScrState();
}

class LoginScrState extends State<LoginScr> {
  final TextEditingController phonenum = TextEditingController();
  final TextEditingController password = TextEditingController();

  void setStateLogin(){
    setState(() {
      login();
    });
  }

  Future login() async {

    if (phonenum.text == "" || password.text == "") {
      Fluttertoast.showToast(
        msg: "Both fields cannot be blank!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0,
      );
    } 
    else {
      try{
        var url = Uri.parse('http://192.168.140.1/Asset%20Management/assets_api.php');
        var response = await http.post(url, body: {
          "phone_num": phonenum.text,
          "pass": password.text,
        });

        // Logging the response body to understand what is returned
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        // Checking if the response is valid JSON
        if (response.statusCode == 200) {
          var data = json.decode(response.body);

          if (data["status"] == "error") {
            Fluttertoast.showToast(
              msg: "Login failed: ${data["message"]}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              fontSize: 16.0,
            );
          } 
          else {
            Fluttertoast.showToast(
              msg: "Login successful",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              fontSize: 16.0,
            );
            if (mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Assets()),
              );
            }
          }
        } 
        else {
          Fluttertoast.showToast(
            msg: "Server error: ${response.statusCode}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            fontSize: 16.0,
          );
        }
      } 
      catch (e) {
        Fluttertoast.showToast(
          msg: "An error occurred: $e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          fontSize: 16.0,
        );
      }
    }
  }


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
          child: ListView(
            children: [
              SizedBox(
                height: size.height * 0.15,
              ),
              const Text(
                "Login Page",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 37,
                  color: Color.fromARGB(255, 41, 41, 41),
                ),
              ),
              SizedBox(height: size.height * 0.07),
              myTextField("Phone Number", Colors.white, phonenum),
              SizedBox(
                height: size.height * 0.01,
              ),
              myTextField("Password", Colors.black12, password),
              SizedBox(
                height: size.height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setStateLogin();
                      },
                      child: Container(
                        width: size.width,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 254, 112, 112),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container myTextField(
      String hint, Color color, TextEditingController textEditingController) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 22,
          ),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.black45,
            fontSize: 19,
          ),
          suffixIcon: Icon(
            Icons.visibility_off_outlined,
            color: color,
          ),
        ),
      ),
    );
  }
}
