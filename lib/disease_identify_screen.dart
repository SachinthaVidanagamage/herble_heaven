import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DiseaseIdentifyScreen extends StatefulWidget {
  const DiseaseIdentifyScreen({super.key});

  @override
  DiseaseIdentifyScreenState createState() => DiseaseIdentifyScreenState();
}

class DiseaseIdentifyScreenState extends State<DiseaseIdentifyScreen> {
  File? _image;
  final picker = ImagePicker();

  // Function to pick or capture an image
  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Disease Identifier"),
        centerTitle: true,
        backgroundColor: Colors.red[800],
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red.shade100, Colors.red.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.white.withOpacity(0.9),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      "Identify a Disease",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _image == null
                        ? Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.red[50],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.red.shade200),
                            ),
                            child: const Icon(
                              Icons.image,
                              size: 100,
                              color: Colors.red,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              _image!,
                              height: 200,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                    const SizedBox(height: 20),
                    const Text(
                      "Upload an image to identify the disease.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => getImage(ImageSource.gallery),
                          icon: const Icon(Icons.photo_library),
                          label: const Text("Gallery"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[700],
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => getImage(ImageSource.camera),
                          icon: const Icon(Icons.camera_alt),
                          label: const Text("Camera"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[700],
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}