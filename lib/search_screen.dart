import 'package:flutter/material.dart';
import 'plant_list_screen.dart';


class SearchScreen extends StatefulWidget {
  final List<Map<String, String>> plants;

  const SearchScreen({super.key, required this.plants});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  List<Map<String, String>> filteredPlants = [];
  String query = "";

  @override
  void initState() {
    super.initState();
    filteredPlants = widget.plants;
  }

  void updateSearch(String searchQuery) {
    setState(() {
      query = searchQuery;
      filteredPlants = widget.plants
          .where((plant) =>
              plant["name"]!.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Plants"),
        backgroundColor: Colors.green.shade800,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: updateSearch,
              decoration: InputDecoration(
                hintText: "Search for a plant...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPlants.length,
              itemBuilder: (context, index) {
                return PlantCard(
                  name: filteredPlants[index]["name"]!,
                  image: filteredPlants[index]["image"]!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
