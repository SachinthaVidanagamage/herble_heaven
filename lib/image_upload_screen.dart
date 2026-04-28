


import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:plant_identifier/price_prediction_screen.dart' as binkohoba_screen; // Prefix added
import 'package:plant_identifier/new_price_prediction.dart' as cinnamon_screen; // Prefix added

final Logger logger = Logger();

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({super.key});

  @override
  ImageUploadScreenState createState() => ImageUploadScreenState();
}

class ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _image;
  final picker = ImagePicker();
  String _result = "No prediction yet";
  bool _isBinkohoba = false;
  bool _isCinnamon = false;

  // Function to pick an image
  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      uploadImage(_image!);
    }
  }

  // Function to upload image and get prediction
  Future<void> uploadImage(File imageFile) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://192.168.8.119:8000/predict/'),
    );
    request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));

    try {
      var response = await request.send();
      var responseData = await response.stream.bytesToString();

      logger.i("API Response: $responseData");

      var jsonResponse = jsonDecode(responseData);
      String prediction = jsonResponse['class_name'] ?? "Unknown";
      double confidence = (jsonResponse['confidence'] ?? 0) * 100;

      setState(() {
        _result = "Prediction: $prediction\nConfidence: ${confidence.toStringAsFixed(2)}%";
        _isBinkohoba = (prediction.toLowerCase() == "binkohoba");
        _isCinnamon = (prediction.toLowerCase() == "cinnamon");
      });
    } catch (e) {
      setState(() {
        _result = "Error processing image";
        _isBinkohoba = false;
        _isCinnamon = false;
      });
      logger.e("Error: $e", error: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100, // Soft background color
      appBar: AppBar(
        title: const Text("Plant Identifier"),
        centerTitle: true,
        backgroundColor: Colors.green.shade700, // Softer green for a modern look
        elevation: 2, // Subtle shadow for depth
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Identify a Plant",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 15),

            // Image Preview Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _image == null
                        ? Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.image, size: 100, color: Colors.green),
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
                    const SizedBox(height: 15),
                    Text(
                      _result,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Buttons for Image Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFlatButton(
                  title: "Gallery",
                  icon: Icons.photo_library,
                  color: Colors.green.shade600,
                  onPressed: () => getImage(ImageSource.gallery),
                ),
                _buildFlatButton(
                  title: "Camera",
                  icon: Icons.camera_alt,
                  color: Colors.green.shade600,
                  onPressed: () => getImage(ImageSource.camera),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Prediction Buttons
            if (_isBinkohoba) _buildPredictionButton("Predict Binkohoba Price", Colors.blueAccent, const binkohoba_screen.PricePredictionScreen()),
            if (_isCinnamon) _buildPredictionButton("Predict Cinnamon Price", Colors.teal, const cinnamon_screen.PricePredictionScreen()),
          ],
        ),
      ),
    );
  }

  // 🔹 Custom Styled Button (Flat)
  Widget _buildFlatButton({required String title, required IconData icon, required Color color, required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
      ),
    );
  }

  // 🔹 Prediction Button
  Widget _buildPredictionButton(String title, Color color, Widget screen) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}








