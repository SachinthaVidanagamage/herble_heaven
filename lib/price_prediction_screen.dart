

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart'; // For month-year formatting

class PricePredictionScreen extends StatefulWidget {
  const PricePredictionScreen({super.key});

  @override
  PricePredictionScreenState createState() => PricePredictionScreenState();
}

class PricePredictionScreenState extends State<PricePredictionScreen> {
  String selectedMonthYear = "";
  String predictedPrice = "Select a month & year to predict the price";

  Future<void> predictPrice(String monthYear) async {
    final url = Uri.parse("http://192.168.8.119:8001/predict_price");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"date": monthYear}), // Send only Month-Year
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        predictedPrice = "Predicted price will be RS ${data['predicted_price'].toStringAsFixed(2)}";
      });
    } else {
      setState(() {
        predictedPrice = "Failed to fetch price";
      });
    }
  }

  // ✅ Custom Month & Year Picker
  Future<void> _selectMonthYear(BuildContext context) async {
    DateTime today = DateTime.now();
    DateTime lastDate = DateTime(2025, 12, 31); // Upper limit

    DateTime? picked = await showMonthYearPicker(
      context: context,
      initialDate: today,
      firstDate: today,
      lastDate: lastDate,
    );

    if (picked != null) {
      setState(() {
        selectedMonthYear = DateFormat('yyyy-MM').format(picked); // Format as YYYY-MM
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100, // Light background
      appBar: AppBar(
        title: const Text(
          "Binkohoba Price Prediction",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ Month-Year Picker Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Text(
                  selectedMonthYear.isEmpty ? "Select Month & Year" : "Selected: $selectedMonthYear",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(Icons.calendar_month, color: Colors.blueAccent),
                onTap: () => _selectMonthYear(context),
              ),
            ),
            const SizedBox(height: 20),

            // ✅ Predict Button
            ElevatedButton(
              onPressed: selectedMonthYear.isNotEmpty
                  ? () => predictPrice(selectedMonthYear)
                  : null, // Disable if no month selected
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                "Predict Price (1Kg)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),

            // ✅ Prediction Result Card
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  predictedPrice,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Custom Month & Year Picker Function
  Future<DateTime?> showMonthYearPicker({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
  }) async {
    int selectedYear = initialDate.year;
    int selectedMonth = initialDate.month;

    return showDialog<DateTime>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select Month & Year"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<int>(
                value: selectedYear,
                items: List.generate(lastDate.year - firstDate.year + 1, (index) {
                  return DropdownMenuItem(
                    value: firstDate.year + index,
                    child: Text("${firstDate.year + index}"),
                  );
                }),
                onChanged: (value) {
                  setState(() {
                    selectedYear = value!;
                  });
                },
              ),
              DropdownButton<int>(
                value: selectedMonth,
                items: List.generate(12, (index) {
                  return DropdownMenuItem(
                    value: index + 1,
                    child: Text(DateFormat.MMMM().format(DateTime(0, index + 1))),
                  );
                }),
                onChanged: (value) {
                  setState(() {
                    selectedMonth = value!;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, null), // Close picker
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, DateTime(selectedYear, selectedMonth));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}










