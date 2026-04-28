/*
import 'package:flutter/material.dart';
import 'image_upload_screen.dart';
import 'disease_identify_screen.dart';
import 'trend_graph_screen.dart'; // Import Trend Graph Screen

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Herbal Heaven'),
        centerTitle: true,
        backgroundColor: Colors.green.shade800,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Welcome to Plant Identifier 🌱",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "Identify plants by capturing or selecting an image. 🌿",
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            
            // 🌿 Button for Plant Identification
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImageUploadScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade800,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text("Identify a Plant"),
            ),
            
            const SizedBox(height: 20),

            // 🦠 Button for Disease Identification
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DiseaseIdentifyScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade800, // Different color for differentiation
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text("Identify a Disease"),
            ),

            const SizedBox(height: 20),

            // 📈 Button for Viewing Price Trends
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TrendGraphScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade800, // Unique color for price trends
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text("View Price Trends"),
            ),

            const SizedBox(height: 30),
            const Text(
              "🌳 Discover the world of plants 🌸",
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}










import 'package:flutter/material.dart';
import 'image_upload_screen.dart';
import 'disease_identify_screen.dart';
import 'trend_graph_screen.dart';
import 'endangered_plant_identifier.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Herbal Heaven'),
        centerTitle: true,
        backgroundColor: Colors.green.shade800,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Welcome to Plant Identifier 🌱",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "Identify plants, detect diseases, and track trends! 🌿",
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // 🌿 Animated Plant Identification Button
            _buildAnimatedButton(
              context,
              title: "Identify a Plant",
              icon: Icons.search,
              color: Colors.green.shade800,
              screen: const ImageUploadScreen(),
            ),

            const SizedBox(height: 20),

            // 🦠 Animated Disease Identification Button
            _buildAnimatedButton(
              context,
              title: "Identify a Disease",
              icon: Icons.healing,
              color: Colors.red.shade800,
              screen: const DiseaseIdentifyScreen(),
            ),

            const SizedBox(height: 20),

            // 📈 Animated View Price Trends Button
            _buildAnimatedButton(
              context,
              title: "View Price Trends",
              icon: Icons.trending_up,
              color: Colors.blue.shade800,
              screen: const TrendGraphScreen(),
            ),

            const SizedBox(height: 20),

            // 🌱 Animated Endangered Plant Identification Button
            _buildAnimatedButton(
              context,
              title: "Identify Endangered Plants",
              icon: Icons.eco,
              color: Colors.teal.shade700,
              screen: const EndangeredPlantIdentifierScreen(),
            ),

            const SizedBox(height: 30),
            const Text(
              "🌳 Discover the world of plants 🌸",
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // 🌟 Reusable Animated Button Widget 🌟
  Widget _buildAnimatedButton(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required Widget screen}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}














import 'package:flutter/material.dart';
import 'image_upload_screen.dart';
import 'disease_identify_screen.dart';
import 'trend_graph_screen.dart';
import 'endangered_plant_identifier.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Herbal Heaven'),
        centerTitle: true,
        backgroundColor: Colors.green.shade800,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Welcome to Plant Identifier 🌱",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "Identify plants, detect diseases, and track trends! 🌿",
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // 🌿 Animated Plant Identification Button
            _buildAnimatedButton(
              context,
              title: "Identify a Plant",
              icon: Icons.search,
              color: Colors.green.shade800,
              screen: const ImageUploadScreen(),
            ),

            const SizedBox(height: 20),

            // 🦠 Animated Disease Identification Button
            _buildAnimatedButton(
              context,
              title: "Identify a Disease",
              icon: Icons.healing,
              color: Colors.red.shade800,
              screen: const DiseaseIdentifyScreen(),
            ),

            const SizedBox(height: 20),

            // 📈 Animated View Price Trends Button
            _buildAnimatedButton(
              context,
              title: "View Price Trends",
              icon: Icons.trending_up,
              color: Colors.blue.shade800,
              screen: const TrendGraphScreen(),
            ),

            const SizedBox(height: 20),

            // 🌱 Animated Endangered Plant Identification Button
            _buildAnimatedButton(
              context,
              title: "Identify Endangered Plants",
              icon: Icons.eco,
              color: Colors.teal.shade700,
              screen: const EndangeredPlantIdentifierScreen(),
            ),

            const SizedBox(height: 30),
            const Text(
              "🌳 Discover the world of plants 🌸",
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // 🌟 Reusable Animated Button Widget 🌟
  Widget _buildAnimatedButton(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required Widget screen}) {
    return InkWell(
      onTap: () {
        _navigateWithAnimation(context, screen);
      },
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🚀 Page Transition with Fade & Slide Effect 🚀
  void _navigateWithAnimation(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0), // Slide from right
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            )),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    );
  }
}















import 'package:flutter/material.dart';
import 'image_upload_screen.dart';
import 'disease_identify_screen.dart';
import 'trend_graph_screen.dart';
import 'endangered_plant_identifier.dart';
import 'cinnamon_api.dart'; // ✅ Import API class

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final CinnamonAPI api = CinnamonAPI();
  String selectedCinnamon = "C5"; // Default selection
  double? predictedPrice;

  void _getPrediction() async {
    double? price = await api.predictPrice(selectedCinnamon);
    setState(() {
      predictedPrice = price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Herbal Heaven'),
        centerTitle: true,
        backgroundColor: Colors.green.shade800,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Welcome to Plant Identifier 🌱",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "Identify plants, detect diseases, and track trends! 🌿",
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            _buildAnimatedButton(
              context,
              title: "Identify a Plant",
              icon: Icons.search,
              color: Colors.green.shade800,
              screen: const ImageUploadScreen(),
            ),
            const SizedBox(height: 20),

            _buildAnimatedButton(
              context,
              title: "Identify a Disease",
              icon: Icons.healing,
              color: Colors.red.shade800,
              screen: const DiseaseIdentifyScreen(),
            ),
            const SizedBox(height: 20),

            _buildAnimatedButton(
              context,
              title: "View Price Trends",
              icon: Icons.trending_up,
              color: Colors.blue.shade800,
              screen: const TrendGraphScreen(),
            ),
            const SizedBox(height: 20),

            _buildAnimatedButton(
              context,
              title: "Identify Endangered Plants",
              icon: Icons.eco,
              color: Colors.teal.shade700,
              screen: const EndangeredPlantIdentifierScreen(),
            ),
            const SizedBox(height: 30),

            // ✅ New Button for Predicting Cinnamon Price
            _buildCinnamonPriceButton(),

            const SizedBox(height: 30),
            const Text(
              "🌳 Discover the world of plants 🌸",
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // 🌟 Reusable Animated Button Widget 🌟
  Widget _buildAnimatedButton(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required Widget screen}) {
    return InkWell(
      onTap: () {
        _navigateWithAnimation(context, screen);
      },
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ New Widget: Cinnamon Price Prediction Button
  Widget _buildCinnamonPriceButton() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.orange.shade100,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.orange, width: 1.5),
          ),
          child: Column(
            children: [
              const Text(
                "Predict Cinnamon Price 🏷️",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: selectedCinnamon,
                items: ["C5", "Alba", "C4", "H1"]
                    .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCinnamon = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _getPrediction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text("Predict Price"),
              ),
              const SizedBox(height: 10),
              if (predictedPrice != null)
                Text(
                  "Predicted Price: RS ${predictedPrice!.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ],
    );
  }

  // 🚀 Page Transition with Fade & Slide Effect 🚀
  void _navigateWithAnimation(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0), // Slide from right
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            )),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    );
  }
}









import 'package:flutter/material.dart';
import 'image_upload_screen.dart';
import 'disease_identify_screen.dart';
import 'trend_graph_screen.dart';
import 'endangered_plant_identifier.dart';
import 'cinnamon_api.dart';
import 'new_price_prediction.dart'; // ✅ Import new file

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final CinnamonAPI api = CinnamonAPI();
  String selectedCinnamon = "C5"; // Default selection
  double? predictedPrice;

  void _getPrediction() async {
    double? price = await api.predictPrice(selectedCinnamon);
    setState(() {
      predictedPrice = price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Herbal Heaven'),
        centerTitle: true,
        backgroundColor: Colors.green.shade800,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Welcome to Plant Identifier 🌱",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "Identify plants, detect diseases, and track trends! 🌿",
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            _buildAnimatedButton(
              context,
              title: "Identify a Plant",
              icon: Icons.search,
              color: Colors.green.shade800,
              screen: const ImageUploadScreen(),
            ),
            const SizedBox(height: 20),

            _buildAnimatedButton(
              context,
              title: "Identify a Disease",
              icon: Icons.healing,
              color: Colors.red.shade800,
              screen: const DiseaseIdentifyScreen(),
            ),
            const SizedBox(height: 20),

            _buildAnimatedButton(
              context,
              title: "View Price Trends",
              icon: Icons.trending_up,
              color: Colors.blue.shade800,
              screen: const TrendGraphScreen(),
            ),
            const SizedBox(height: 20),

            _buildAnimatedButton(
              context,
              title: "Identify Endangered Plants",
              icon: Icons.eco,
              color: Colors.teal.shade700,
              screen: const EndangeredPlantIdentifierScreen(),
            ),
            const SizedBox(height: 30),

            // ✅ Updated Cinnamon Price Button
            _buildCinnamonPriceButton(),

            const SizedBox(height: 30),
            const Text(
              "🌳 Discover the world of plants 🌸",
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // 🌟 Reusable Animated Button Widget 🌟
  Widget _buildAnimatedButton(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required Widget screen}) {
    return InkWell(
      onTap: () {
        _navigateWithAnimation(context, screen);
      },
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ New Widget: Cinnamon Price Prediction Button
  Widget _buildCinnamonPriceButton() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.orange.shade100,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.orange, width: 1.5),
          ),
          child: Column(
            children: [
              const Text(
                "Predict Cinnamon Price 🏷️",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: selectedCinnamon,
                items: ["C5", "Alba", "C4", "H1"]
                    .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCinnamon = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _getPrediction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text("Predict Price"),
              ),
              const SizedBox(height: 10),
              if (predictedPrice != null)
                Text(
                  "Predicted Price: RS ${predictedPrice!.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 20),

              // ✅ New Button: Navigate to `new_price_prediction.dart`
              ElevatedButton(
                onPressed: () {
                  _navigateWithAnimation(context, const PricePredictionScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text("View Detailed Price Predictions"),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 🚀 Page Transition with Fade & Slide Effect 🚀
  void _navigateWithAnimation(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0), // Slide from right
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            )),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    );
  }
}
*/



import 'package:flutter/material.dart';
import 'image_upload_screen.dart';
import 'disease_identify_screen.dart';
import 'trend_graph_screen.dart';
import 'endangered_plant_identifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100, // Light background for a modern look
      appBar: AppBar(
        title: const Text(
          'Herbal Heaven 🌿',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade700, // Soft green
        elevation: 0, // No harsh shadow
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Welcome to Your Plant Guide 🌱",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Identify plants, detect diseases, track trends, and explore endangered species.",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            _buildActionButton(
              context,
              title: "🌿 Identify a Plant",
              icon: Icons.search,
              color: Colors.green.shade600,
              screen: const ImageUploadScreen(),
            ),
            const SizedBox(height: 20),

            _buildActionButton(
              context,
              title: "🩺 Identify a Disease",
              icon: Icons.healing,
              color: Colors.red.shade500,
              screen: const DiseaseIdentifyScreen(),
            ),
            const SizedBox(height: 20),

            _buildActionButton(
              context,
              title: "📈 View Price Trends",
              icon: Icons.trending_up,
              color: Colors.blue.shade500,
              screen: const TrendGraphScreen(),
            ),
            const SizedBox(height: 20),

            _buildActionButton(
              context,
              title: "🌍 Endangered Plants",
              icon: Icons.eco,
              color: Colors.teal.shade500,
              screen: const EndangeredPlantIdentifierScreen(),
            ),
            const SizedBox(height: 30),

            // 🌟 Footer Section 🌟
            const Text(
              "Grow, Learn, and Protect Nature 🌳",
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // 🌟 Clean & Minimalistic Button 🌟
  Widget _buildActionButton(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required Widget screen}) {
    return ElevatedButton(
      onPressed: () {
        _navigateWithAnimation(context, screen);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        elevation: 3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 26),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  // 🚀 Smooth Page Transition 🚀
  void _navigateWithAnimation(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }
}

