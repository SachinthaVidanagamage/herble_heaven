
/*
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'map_screen.dart'; // Import the Map Screen

class EndangeredPlantIdentifierScreen extends StatefulWidget {
  const EndangeredPlantIdentifierScreen({super.key});

  @override
  EndangeredPlantIdentifierScreenState createState() =>
      EndangeredPlantIdentifierScreenState();
}

class EndangeredPlantIdentifierScreenState
    extends State<EndangeredPlantIdentifierScreen> {
  File? _image;
  final picker = ImagePicker();
  String _prediction = "Upload an image to identify the plant.";
  bool _isLoading = false;

  // Function to pick or capture an image
  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _prediction = "Processing image...";
      });
      await identifyPlant(_image!);
    }
  }

  // Function to send image to FastAPI and get prediction
  Future<void> identifyPlant(File imageFile) async {
    setState(() {
      _isLoading = true;
    });

    var uri = Uri.parse("http://192.168.8.119:8003/predict");
    var request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var jsonData = json.decode(responseData);
        setState(() {
          _prediction = jsonData['prediction'] ?? "Unknown plant";
        });
      } else {
        setState(() {
          _prediction = "Error: Unable to identify plant.";
        });
      }
    } catch (e) {
      setState(() {
        _prediction = "Error: Unable to connect to server.";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Endangered Plant Identifier"),
        centerTitle: true,
        backgroundColor: Colors.green[700],
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade100, Colors.green.shade50],
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
              color: Colors.white.withOpacity(0.95),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      "Identify an Endangered Plant",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _image == null
                        ? Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.green.shade300),
                            ),
                            child: const Icon(
                              Icons.nature,
                              size: 100,
                              color: Colors.green,
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
                    _isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                            _prediction,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
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
                            backgroundColor: Colors.green[700],
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
                            backgroundColor: Colors.green[700],
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    
                    // New Button to Navigate to Map Screen
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MapScreen()),
                        );
                      },
                      icon: const Icon(Icons.map),
                      label: const Text(" Conservation Areas for Binkohomba"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
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











import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:plant_identifier/map_screen.dart' as map1; // Use prefix for map_screen.dart
import 'package:plant_identifier/map_screen2.dart' as map2; // Use prefix for map_screen2.dart

class EndangeredPlantIdentifierScreen extends StatefulWidget {
  const EndangeredPlantIdentifierScreen({super.key});

  @override
  EndangeredPlantIdentifierScreenState createState() =>
      EndangeredPlantIdentifierScreenState();
}

class EndangeredPlantIdentifierScreenState
    extends State<EndangeredPlantIdentifierScreen> {
  File? _image;
  final picker = ImagePicker();
  String _prediction = "Upload an image to identify the plant.";
  bool _isLoading = false;

  // Function to pick or capture an image
  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _prediction = "Processing image...";
      });
      await identifyPlant(_image!);
    }
  }

  // Function to send image to FastAPI and get prediction
  Future<void> identifyPlant(File imageFile) async {
    setState(() {
      _isLoading = true;
    });

    var uri = Uri.parse("http://192.168.8.119:8003/predict");
    var request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var jsonData = json.decode(responseData);
        setState(() {
          _prediction = jsonData['prediction'] ?? "Unknown plant";
        });
      } else {
        setState(() {
          _prediction = "Error: Unable to identify plant.";
        });
      }
    } catch (e) {
      setState(() {
        _prediction = "Error: Unable to connect to server.";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Endangered Plant Identifier"),
        centerTitle: true,
        backgroundColor: Colors.green[700],
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade100, Colors.green.shade50],
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
              color: Colors.white.withOpacity(0.95),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      "Identify an Endangered Plant",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _image == null
                        ? Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.green.shade300),
                            ),
                            child: const Icon(
                              Icons.nature,
                              size: 100,
                              color: Colors.green,
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
                    _isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                            _prediction,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
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
                            backgroundColor: Colors.green[700],
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
                            backgroundColor: Colors.green[700],
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    
                    // Button for Conservation Areas for Binkohomba
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const map1.MapScreen()), // Using prefix for map_screen.dart
                        );
                      },
                      icon: const Icon(Icons.map),
                      label: const Text("Conservation Areas for Binkohomba"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                    ),

                    const SizedBox(height: 10), // Add spacing between buttons

                    // Button for Conservation Areas for Ekaweriya
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const map2.MapScreen()), // Using prefix for map_screen2.dart
                        );
                      },
                      icon: const Icon(Icons.map),
                      label: const Text("Conservation Areas for Ekaweriya"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple[700],
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
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


*/






import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:plant_identifier/map_screen.dart' as map1; // Binkohomba conservation map
import 'package:plant_identifier/map_screen2.dart' as map2; // Ekaweriya conservation map

class EndangeredPlantIdentifierScreen extends StatefulWidget {
  const EndangeredPlantIdentifierScreen({super.key});

  @override
  EndangeredPlantIdentifierScreenState createState() =>
      EndangeredPlantIdentifierScreenState();
}

class EndangeredPlantIdentifierScreenState
    extends State<EndangeredPlantIdentifierScreen> {
  File? _image;
  final picker = ImagePicker();
  String _prediction = "Upload an image to identify the plant.";
  bool _isLoading = false;
  bool _isEkaveriya = false; // Track if prediction is Ekaweriya
  bool _isBinkohomba = false; // Track if prediction is Binkohomba

  // Function to pick or capture an image
  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _prediction = "Processing image...";
        _isEkaveriya = false;
        _isBinkohomba = false;
      });
      await identifyPlant(_image!);
    }
  }

  // Function to send image to FastAPI and get prediction
  Future<void> identifyPlant(File imageFile) async {
    setState(() {
      _isLoading = true;
    });

    var uri = Uri.parse("http://192.168.8.119:8003/predict");
    var request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var jsonData = json.decode(responseData);
        String plantName = jsonData['prediction'] ?? "Unknown plant";

        setState(() {
          _prediction = plantName;
          _isEkaveriya = (plantName.toLowerCase() == "ekaveriya engendered");
          _isBinkohomba = (plantName.toLowerCase() == "binkohomba engendered");

        });
      } else {
        setState(() {
          _prediction = "Error: Unable to identify plant.";
          _isEkaveriya = false;
          _isBinkohomba = false;
        });
      }
    } catch (e) {
      setState(() {
        _prediction = "Error: Unable to connect to server.";
        _isEkaveriya = false;
        _isBinkohomba = false;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Endangered Plant Identifier"),
        centerTitle: true,
        backgroundColor: Colors.green[700],
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade100, Colors.green.shade50],
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
              color: Colors.white.withOpacity(0.95),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      "Identify an Endangered Plant",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _image == null
                        ? Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.green.shade300),
                            ),
                            child: const Icon(
                              Icons.nature,
                              size: 100,
                              color: Colors.green,
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
                    _isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                            _prediction,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
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
                            backgroundColor: Colors.green[700],
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
                            backgroundColor: Colors.green[700],
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    
                    // Show button if Binkohomba is detected
                    if (_isBinkohomba)
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const map1.MapScreen()), // Navigate to Binkohomba conservation areas
                          );
                        },
                        icon: const Icon(Icons.map),
                        label: const Text("Conservation Areas for Binkohomba"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                      ),

                    const SizedBox(height: 10),

                    // Show button if Ekaweriya is detected
                    if (_isEkaveriya)
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const map2.MapScreen()), // Navigate to Ekaweriya conservation areas
                          );
                        },
                        icon: const Icon(Icons.map),
                        label: const Text("Conservation Areas for Ekaweriya"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple[700],
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
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
