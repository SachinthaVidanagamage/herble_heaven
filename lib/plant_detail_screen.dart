import 'package:flutter/material.dart';

class PlantDetailScreen extends StatelessWidget {
  final String name;
  final String image;

  const PlantDetailScreen({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.green.shade800,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(image, width: 200, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
