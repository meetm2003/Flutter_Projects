import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'assets.dart';
import 'imagetextfield.dart';
import 'package:http/http.dart' as http;
import 'custombody.dart';
import 'customappbar.dart';

class AddAsset extends StatefulWidget {
  const AddAsset({super.key});

  @override
  AddAssetState createState() => AddAssetState();
}

class AddAssetState extends State<AddAsset> {
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  TextEditingController deptNameController = TextEditingController();

  File? billImage;
  File? assetImage;

  final _formKey = GlobalKey<FormState>();

  Future<void> submitData() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (billImage != null && assetImage != null) {
      final billImageBytes = await billImage!.readAsBytes();
      final assetImageBytes = await assetImage!.readAsBytes();
      final billImageBase64 = base64Encode(billImageBytes);
      final assetImageBase64 = base64Encode(assetImageBytes);

      try {
        final response = await http.post(
          Uri.parse(
              'http://192.168.140.1/Asset%20Management/assets_insert_api.php'),
          body: {
            'dept_name': deptNameController.text,
            'warranty_date': dateController.text,
            'bill_img': billImageBase64,
            'assets_img': assetImageBase64,
          },
        );

        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          if (responseData['success'] == true) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Assets(),
              ),
            );
          } else {
            print(responseData['error']);
          }
        } else {
          print('Server error: ${response.statusCode}');
        }
      } catch (e) {
        print('An error occurred: $e');
      }
    } else {
      print('Both images are required');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: "Add Asset",
      ),
      body: CustomBody(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: deptNameController,
                            decoration: const InputDecoration(
                              labelText: "Department Name",
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the department name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: dateController,
                            decoration: const InputDecoration(
                              labelText: "Warranty Date",
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              border: OutlineInputBorder(),
                            ),
                            onTap: () async {
                              DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                              );
                              if (picked != null) {
                                setState(() {
                                  dateController.text =
                                      "${picked.day}/${picked.month}/${picked.year}";
                                });
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the warranty date';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          ImageTextField(
                            label: "Bill Image",
                            onImageSelected: (image) {
                              setState(() {
                                billImage = image;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          ImageTextField(
                            label: "Asset Image",
                            onImageSelected: (image) {
                              setState(() {
                                assetImage = image;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: ElevatedButton.icon(
                              onPressed: submitData,
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
                              label: const Text("Add Asset"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
