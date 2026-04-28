
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sri Lanka Plant Conservation Areas")),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(7.8731, 80.7718), // Sri Lanka
          initialZoom: 7.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
          const MarkerLayer(
            markers: [
              // Sinharaja Forest Reserve
              Marker(
                point: LatLng(6.4050, 80.4020),
                width: 30,
                height: 30,
                child: Icon(Icons.place, color: Colors.blue, size: 30),
              ),
              // Kanneliya-Dediyagala-Nakiyadeniya (KDN) Complex
              Marker(
                point: LatLng(6.2753, 80.3389),
                width: 30,
                height: 30,
                child: Icon(Icons.place, color: Colors.green, size: 30),
              ),
              // Hakgala Strict Nature Reserve
              Marker(
                point: LatLng(6.9510, 80.7800),
                width: 30,
                height: 30,
                child: Icon(Icons.place, color: Colors.purple, size: 30),
              ),
              // Peak Wilderness Sanctuary
              Marker(
                point: LatLng(6.8093, 80.4999),
                width: 30,
                height: 30,
                child: Icon(Icons.place, color: Colors.red, size: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
