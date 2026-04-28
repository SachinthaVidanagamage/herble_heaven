/*
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sri Lanka Plant Map")),
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
              Marker(
                point: LatLng(6.9271, 80.7718), // Tea cultivation area
                width: 30,
                height: 30,
                child: Icon(Icons.place, color: Colors.red, size: 30),
              ),
              Marker(
                point: LatLng(7.2906, 80.6337), // Kandy Botanical Garden
                width: 30,
                height: 30,
                child: Icon(Icons.place, color: Colors.green, size: 30),
              ),
              Marker(
                point: LatLng(6.0535, 80.2209), // Sinharaja Rainforest
                width: 30,
                height: 30,
                child: Icon(Icons.place, color: Colors.blue, size: 30),
              ),
              Marker(
                point: LatLng(8.3563, 80.5020), // Wilpattu National Park
                width: 30,
                height: 30,
                child: Icon(Icons.place, color: Colors.orange, size: 30),
              ),
              Marker(
                point: LatLng(6.9518, 80.7891), // Horton Plains National Park
                width: 30,
                height: 30,
                child: Icon(Icons.place, color: Colors.purple, size: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sri Lanka Plant Map")),
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
              // Knuckles Conservation Forest
              Marker(
                point: LatLng(7.4553, 80.7847), 
                width: 30,
                height: 30,
                child: Icon(Icons.place, color: Colors.teal, size: 30),
              ),
              // Wilpattu National Park
              Marker(
                point: LatLng(8.3563, 80.5020),
                width: 30,
                height: 30,
                child: Icon(Icons.place, color: Colors.orange, size: 30),
              ),
              // Ritigala Strict Nature Reserve
              Marker(
                point: LatLng(8.2114, 80.7193), 
                width: 30,
                height: 30,
                child: Icon(Icons.place, color: Colors.brown, size: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
