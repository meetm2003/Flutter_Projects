import 'dart:convert';
import 'dart:typed_data';
import 'package:asset_management/add_asset.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'asset_details.dart';

class Assets extends StatefulWidget {
  const Assets({super.key});

  @override
  AssetState createState() => AssetState();
}

class AssetState extends State<Assets> {
  List<Map<String, dynamic>> assets = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchAssets();
  }

  Future<void> fetchAssets() async {
    final url = Uri.parse('http://192.168.140.1/Asset%20Management/assets_fetch_api.php');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        setState(() {
          assets = jsonResponse.map<Map<String, dynamic>>((item) {
            if (item['bill_img'] != null && item['bill_img'].isNotEmpty) {
              item['bill_img'] = base64Decode(item['bill_img']);
            }
            if (item['assets_img'] != null && item['assets_img'].isNotEmpty) {
              item['assets_img'] = base64Decode(item['assets_img']);
            }
            return item;
          }).toList();
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load assets, status code: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error occurred while fetching assets: $e';
        isLoading = false;
      });
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
                height: size.height * 0.05,
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
                      onPressed: () {
                        Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AddAsset(),
                                  ),
                                );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            const Color.fromARGB(255, 254, 112, 112),
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
                          final asset = assets[index];
                          print('Rendering asset: $asset'); // Debug print
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
                              leading: asset['assets_img'] != null && asset['assets_img'] is Uint8List
                                  ? Image.memory(
                                      asset['assets_img'],
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    )
                                  : const Icon(Icons.image_not_supported),
                              title: Text(
                                asset['dept_name'] ?? '',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                asset['warranty_date'] ?? '',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                              onTap: () {
                                final assetId = asset['id'];
                                print('Tapped asset with ID: $assetId');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AssetDetails(asset: assets[index]),
                                  ),
                                );
                              },
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
