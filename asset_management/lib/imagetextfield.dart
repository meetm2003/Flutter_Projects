import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageTextField extends StatefulWidget {
  final String label;
  final ValueChanged<File?> onImageSelected;

  const ImageTextField({
    required this.label,
    required this.onImageSelected,
    super.key,
  });

  @override
  ImageTextFieldState createState() => ImageTextFieldState();
}

class ImageTextFieldState extends State<ImageTextField> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _controller = TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _controller.text = pickedFile.path;
      });
      widget.onImageSelected(_selectedImage);
    }
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPicker(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: widget.label,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              border: const OutlineInputBorder(),
            ),
            readOnly: true,
            onTap: () => _showPicker(context),
          ),
        ],
      ),
    );
  }
}
