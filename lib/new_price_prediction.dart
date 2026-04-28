/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const CinnamonPriceApp());
}

class CinnamonPriceApp extends StatelessWidget {
  const CinnamonPriceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PricePredictionScreen(),
    );
  }
}

class PricePredictionScreen extends StatefulWidget {
  const PricePredictionScreen({super.key});

  @override
  PricePredictionScreenState createState() => PricePredictionScreenState();
}

class PricePredictionScreenState extends State<PricePredictionScreen> {
  List<dynamic> predictions = [];
  double averagePrice = 0.0;
  bool isLoading = false;
  final String apiUrl = "http://192.168.8.119:8002/predict/";

  Future<void> fetchPredictions() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          predictions = data["predictions"];
          averagePrice = data["average_price"];
        });
      } else {
        throw Exception("Failed to load predictions");
      }
    } catch (e) {
      debugPrint("Error: $e");

      if (!mounted) return; // ✅ Ensure the widget is mounted before using context

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed to fetch data. Check your connection."),
          backgroundColor: Colors.red,
        ),
      );
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPredictions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cinnamon Price Prediction"),
        backgroundColor: Colors.teal.shade700, // Changed to teal shade
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.teal))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Predicted Prices 📊",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal),
                  ),
                  const SizedBox(height: 10),
                  predictions.isEmpty
                      ? const Center(
                          child: Text(
                            "No data available",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: predictions.length,
                            itemBuilder: (context, index) {
                              final prediction = predictions[index];
                              return Card(
                                elevation: 4,
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                color: Colors.teal.shade50, // Light teal card background
                                child: ListTile(
                                  title: Text(
                                    "📅 Date: ${prediction['date']}",
                                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                                  ),
                                  subtitle: Text(
                                    "💰 Predicted Price: Rs ${prediction['predicted_price']}",
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.teal),
                                  ),
                                  leading: const Icon(Icons.trending_up, color: Colors.green),
                                ),
                              );
                            },
                          ),
                        ),
                  const SizedBox(height: 20),
                  Text(
                    "📉 Average Price for next 3 months: Rs ${averagePrice.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: fetchPredictions,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal.shade700, // Changed to match app color
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "🔄 Refresh Data",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const CinnamonPriceApp());
}

class CinnamonPriceApp extends StatelessWidget {
  const CinnamonPriceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PricePredictionScreen(),
    );
  }
}

class PricePredictionScreen extends StatefulWidget {
  const PricePredictionScreen({super.key});

  @override
  PricePredictionScreenState createState() => PricePredictionScreenState();
}

class PricePredictionScreenState extends State<PricePredictionScreen> {
  double averagePrice = 0.0;
  bool isLoading = false;
  final String apiUrl = "http://192.168.8.119:8002/predict/";

  Future<void> fetchPrediction() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          averagePrice = data["average_price"];
        });
      } else {
        throw Exception("Failed to load predictions");
      }
    } catch (e) {
      debugPrint("Error: $e");

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed to fetch data. Check your connection."),
          backgroundColor: Colors.red,
        ),
      );
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPrediction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cinnamon Price Prediction"),
        backgroundColor: Colors.teal.shade700,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.teal))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Text(
                    "📉 Average Price for next 3 months:",
                    style: TextStyle(fontSize: 22, color: Colors.teal.shade800, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Rs ${averagePrice.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: fetchPrediction,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal.shade700,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "🔄 Refresh Data",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
