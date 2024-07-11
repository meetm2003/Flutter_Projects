import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Assets extends StatefulWidget {
  const Assets({super.key});

  @override
  Assetstate createState() => Assetstate();
}

class Assetstate extends State<Assets> {
  List<Map<String, dynamic>> assets = [];

  @override
  void initState() {
    super.initState();
    fetchAssets();
  }

  Future<void> fetchAssets() async {
    final url = Uri.parse('http://192.168.106.1/Asset%20Management/assets_fetch_api.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        print('Response body: ${response.body}'); // Debug print
        if (response.body.isNotEmpty) {
          final List<dynamic> jsonResponse = json.decode(response.body);
          setState(() {
            assets = List<Map<String, dynamic>>.from(jsonResponse);
          });
        } else {
          print('Empty response body');
        }
      } catch (e) {
        // Log the error if JSON parsing fails
        print('Error parsing JSON: $e');
      }
    } else {
      // Log if the response status is not 200
      print('Failed to load assets, status code: ${response.statusCode}');
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
               child: assets.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        itemCount: assets.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 20,
                              ),
                              // leading: assets[index][''] != null
                              //     ? Image.network(
                              //         assets[index]['image_url'],
                              //         width: 50,
                              //         height: 50,
                              //         fit: BoxFit.cover,
                              //       )
                              //     : const Icon(Icons.image_not_supported),
                              title: Text(
                                assets[index]['dept_name'],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                assets[index]['warranty_date'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
