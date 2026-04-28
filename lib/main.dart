
/*







import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page.dart';
import 'plant_list_screen.dart';
import 'settings_screen.dart';
import 'map_screen.dart';
import 'price_prediction_screen.dart';
import 'localization.dart'; // Import localization file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false; // Default to Light Mode

  void toggleTheme(bool isDark) {
    setState(() {
      _isDarkMode = isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant Identifier',
      translations: AppTranslations(),
      locale: const Locale('en'), // Default Language
      fallbackLocale: const Locale('en'),
      theme: ThemeData(
        brightness: _isDarkMode ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.green,
      ),
      home: MainScreen(toggleTheme: toggleTheme),
    );
  }
}

class MainScreen extends StatefulWidget {
  final Function(bool) toggleTheme;

  const MainScreen({super.key, required this.toggleTheme});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Move `_screens` inside `build()` so `widget.toggleTheme` is accessible
    final List<Widget> screens = [
      const HomePage(),
      const PlantListScreen(),
      const MapScreen(),
      const PricePredictionScreen(),
      SettingsScreen(toggleTheme: widget.toggleTheme), // ✅ Now widget.toggleTheme is accessible
    ];

    return Scaffold(
      body: screens[_selectedIndex], // ✅ Use local `screens` list
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green.shade800,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'home'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.list), label: 'plants'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.map), label: 'map'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.attach_money), label: 'predict_price'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.settings), label: 'settings'.tr),
        ],
      ),
    );
  }
}















import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page.dart';
import 'plant_list_screen.dart';
import 'settings_screen.dart';
import 'price_prediction_screen.dart';
import 'localization.dart'; // Import localization file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false; // Default to Light Mode

  void toggleTheme(bool isDark) {
    setState(() {
      _isDarkMode = isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant Identifier',
      translations: AppTranslations(),
      locale: const Locale('en'), // Default Language
      fallbackLocale: const Locale('en'),
      theme: ThemeData(
        brightness: _isDarkMode ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.green,
      ),
      home: MainScreen(toggleTheme: toggleTheme),
    );
  }
}

class MainScreen extends StatefulWidget {
  final Function(bool) toggleTheme;

  const MainScreen({super.key, required this.toggleTheme});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Removed MapScreen from the list
    final List<Widget> screens = [
      const HomePage(),
      const PlantListScreen(),
      const PricePredictionScreen(),
      SettingsScreen(toggleTheme: widget.toggleTheme),
    ];

    return Scaffold(
      body: screens[_selectedIndex], 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green.shade800,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'home'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.list), label: 'plants'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.attach_money), label: 'predict_price'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.settings), label: 'settings'.tr),
        ],
      ),
    );
  }
}

*/



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page.dart';
import 'plant_list_screen.dart';
import 'settings_screen.dart';
import 'price_prediction_screen.dart';
import 'localization.dart'; // Import localization file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false; // Default Light Mode

  void toggleTheme(bool isDark) {
    setState(() {
      _isDarkMode = isDark;
      Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant Identifier',
      translations: AppTranslations(), // Localization support
      locale: Get.deviceLocale ?? const Locale('en'), // Auto-detect system locale
      fallbackLocale: const Locale('en'), // Default to English
      theme: ThemeData.light(), // Light Mode
      darkTheme: ThemeData.dark(), // Dark Mode
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light, // Apply theme
      home: MainScreen(toggleTheme: toggleTheme), // Pass toggleTheme function
    );
  }
}

class MainScreen extends StatefulWidget {
  final Function(bool) toggleTheme;

  const MainScreen({super.key, required this.toggleTheme});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const HomePage(),
      const PlantListScreen(),
      const PricePredictionScreen(),
      SettingsScreen(toggleTheme: widget.toggleTheme), // ✅ Fixed: Pass toggleTheme
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green.shade800,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'home'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.list), label: 'plants'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.attach_money), label: 'predict_price'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.settings), label: 'settings'.tr),
        ],
      ),
    );
  }
}




