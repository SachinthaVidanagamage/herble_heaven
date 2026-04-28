/*
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant List',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const PlantListScreen(),
    );
  }
}

class PlantListScreen extends StatelessWidget {
  const PlantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> plants = [
  {
    "name": "Aloe Vera (Aloe barbadensis miller)", 
    "image": "https://www.kew.org/sites/default/files/styles/original/public/2020-04/Aloe_Vera.jpg.webp"
  },
  {
    "name": "Basil (Ocimum basilicum)", 
    "image": "https://www.veggycation.com.au/siteassets/veggycationvegetable/basil.jpg"
  },
  {
    "name": "Lavender (Lavandula angustifolia)", 
    "image": "https://cdn.shopify.com/s/files/1/0085/2344/8371/files/beautiful-flowers_480x480.jpg?v=1691480612"
  },
  {
    "name": "Ekaweriya (Rauvolfia serpentina)", 
    "image": "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiLlQfFtqBTM7bYI_vxPJ8pRjq61imvQ1HHsHyObg7vcfLK5xd2VuDM7XvoANQwmG1eiMci6XEOoBEOPB0eXXDfImFxph1u8s_0hsHUvbX6AMjGZla6LnBsmcBn5yMMQlrDocmw2j8w/s1600/ekaweriya-Rauwolfia+serpentina.jpg"
  },
  {
    "name": "Binkohoba (Ginkgo biloba)", 
    "image": "https://us.lakpura.com/cdn/shop/files/LSLP00552C-01-E.jpg?v=1722662998&width=1946"
  },
  {
    "name": "Ginger (Zingiber officinale)", 
    "image": "https://5.imimg.com/data5/SELLER/Default/2024/4/412796709/TY/WC/ND/199770925/organic-fresh-ginger.jpeg"
  },
  {
    "name": "Siduhadun (Aristolochia indica)", 
    "image": "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEianE2p_LKSvDcuT14p_QT_68ndefvSe94mYHEAyfWa9G3M_hFFYslczqadYYvgXYgvvMbbSEfvZb4VGC8PfR_e2qMNQwZUjUM7RZZix5mP-iHhJq8Wi51e5KWKURswT9MvpvSuhkn6tIE/s1600/DSC_0143.jpg"
  },
  {
    "name": "Rosemary (Rosmarinus officinalis)", 
    "image": "https://klec.jayagrocer.com/cdn/shop/files/071653-1-1_800x.jpg?v=1726136958"
  }
];


    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant List'),
        backgroundColor: Colors.green.shade800,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Navigate to the search screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen(plants: plants)),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: plants.length,
        itemBuilder: (context, index) {
          return PlantCard(
            name: plants[index]["name"]!,
            image: plants[index]["image"]!,
          );
        },
      ),
    );
  }
}

// Reusable PlantCard widget
class PlantCard extends StatelessWidget {
  final String name;
  final String image;

  const PlantCard({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(image, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(name),
        subtitle: const Text("Tap to view details"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlantDetailScreen(name: name, image: image), // Fixed this error
            ),
          );
        },
      ),
    );
  }
}

// Plant Detail Screen (MISSING BEFORE)
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

// Search Screen
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
*/



import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant List',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const PlantListScreen(),
    );
  }
}

class PlantListScreen extends StatelessWidget {
  const PlantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> plants = [
      {
        "name": "Aloe Vera (Aloe barbadensis miller)",
        "image":
            "https://www.kew.org/sites/default/files/styles/original/public/2020-04/Aloe_Vera.jpg.webp"
      },
      {
        "name": "Basil (Ocimum basilicum)",
        "image":
            "https://www.veggycation.com.au/siteassets/veggycationvegetable/basil.jpg"
      },
      {
        "name": "Lavender (Lavandula angustifolia)",
        "image":
            "https://cdn.shopify.com/s/files/1/0085/2344/8371/files/beautiful-flowers_480x480.jpg?v=1691480612"
      },
      {
        "name": "Ekaweriya (Rauvolfia serpentina)",
        "image":
            "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiLlQfFtqBTM7bYI_vxPJ8pRjq61imvQ1HHsHyObg7vcfLK5xd2VuDM7XvoANQwmG1eiMci6XEOoBEOPB0eXXDfImFxph1u8s_0hsHUvbX6AMjGZla6LnBsmcBn5yMMQlrDocmw2j8w/s1600/ekaweriya-Rauwolfia+serpentina.jpg"
      },
      {
        "name": "Binkohoba (Ginkgo biloba)",
        "image":
            "https://us.lakpura.com/cdn/shop/files/LSLP00552C-01-E.jpg?v=1722662998&width=1946"
      },
      {
        "name": "Ginger (Zingiber officinale)",
        "image":
            "https://5.imimg.com/data5/SELLER/Default/2024/4/412796709/TY/WC/ND/199770925/organic-fresh-ginger.jpeg"
      },
      {
        "name": "Siduhadun (Aristolochia indica)",
        "image":
            "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEianE2p_LKSvDcuT14p_QT_68ndefvSe94mYHEAyfWa9G3M_hFFYslczqadYYvgXYgvvMbbSEfvZb4VGC8PfR_e2qMNQwZUjUM7RZZix5mP-iHhJq8Wi51e5KWKURswT9MvpvSuhkn6tIE/s1600/DSC_0143.jpg"
      },
      {
        "name": "Rosemary (Rosmarinus officinalis)",
        "image":
            "https://media.istockphoto.com/id/503780310/photo/rosemary.jpg?s=612x612&w=0&k=20&c=uAcZOP9Chp4vLNx4EJHvmEkhu4HGw6nXL7xxR3aEWk0="
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant List'),
        backgroundColor: Colors.green.shade800,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Navigate to the search screen
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchScreen(plants: plants)),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: plants.length,
        itemBuilder: (context, index) {
          return PlantCard(
            name: plants[index]["name"]!,
            image: plants[index]["image"]!,
          );
        },
      ),
    );
  }
}

// Reusable PlantCard widget (Updated with clickable image & name)
class PlantCard extends StatelessWidget {
  final String name;
  final String image;

  const PlantCard({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PlantDetailScreen(name: name, image: image)),
            );
          },
          child: Image.network(image, width: 50, height: 50, fit: BoxFit.cover),
        ),
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PlantDetailScreen(name: name, image: image)),
            );
          },
          child: Text(
            name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        subtitle: const Text("Tap to view details"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PlantDetailScreen(name: name, image: image)),
          );
        },
      ),
    );
  }
}

// Plant Detail Screen
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
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// Search Screen
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
          .where((plant) => plant["name"]!
              .toLowerCase()
              .contains(searchQuery.toLowerCase()))
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
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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
