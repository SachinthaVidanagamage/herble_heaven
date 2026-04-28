/*
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  bool _notifications = true;
  String _selectedLanguage = "English";

  static const List<String> _languages = ["English", "Sinhala", "Tamil"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.green.shade800,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Section
          const Card(
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://media.licdn.com/dms/image/v2/D5603AQEwedF7mOxA9A/profile-displayphoto-shrink_800_800/B56ZO.SlA7HIAc-/0/1734064363522?e=1744243200&v=beta&t=BIxo82dMl16186Pf5ZjjNbBQLrbRJPpoKVyErFzAvv0'),
              ),
              title: Text(
                'Sachintha Vidanagamage',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('sachinthavida@gmail.com'),
            ),
          ),
          const SizedBox(height: 20),

          // Dark Mode Toggle
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value;
              });
            },
            secondary: const Icon(Icons.dark_mode),
          ),

          // Notification Toggle
          SwitchListTile(
            title: const Text('Enable Notifications'),
            value: _notifications,
            onChanged: (value) {
              setState(() {
                _notifications = value;
              });
            },
            secondary: const Icon(Icons.notifications),
          ),

          // Language Selection
          ListTile(
            title: const Text('Language'),
            leading: const Icon(Icons.language),
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                });
              },
              items: _languages.map<DropdownMenuItem<String>>((String lang) {
                return DropdownMenuItem<String>(
                  value: lang,
                  child: Text(lang),
                );
              }).toList(),
            ),
          ),

          const Divider(),

          // About Section
          ListTile(
            title: const Text('About App'),
            leading: const Icon(Icons.info),
            subtitle: const Text('Version 1.0.0'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "Plant Guide",
                applicationVersion: "1.0.0",
                applicationIcon: const Icon(Icons.eco, size: 40),
                children: const [
                  Text(
                      "This is a simple plant guide app developed using Flutter."),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}












*/



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  final Function(bool) toggleTheme; // ✅ Add toggleTheme parameter

  const SettingsScreen({super.key, required this.toggleTheme}); // ✅ Make it required

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  bool _notifications = true;
  String _selectedLanguage = "English";
  String _username = "Sachintha Vidanagamage";
  String _email = "sachinthavida@gmail.com";

  static const List<Map<String, dynamic>> _languages = [
    {"name": "English", "locale": Locale("en")},
    {"name": "Sinhala", "locale": Locale("si")},
    {"name": "Tamil", "locale": Locale("ta")},
  ];

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = prefs.getBool('darkMode') ?? false;
      _notifications = prefs.getBool('notifications') ?? true;
      _selectedLanguage = prefs.getString('language') ?? "English";
      _username = prefs.getString('username') ?? "Sachintha Vidanagamage";
      _email = prefs.getString('email') ?? "sachinthavida@gmail.com";
    });
  }

  Future<void> _updateSettings(String key, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is String) {
      await prefs.setString(key, value);
    }
  }

  void _changeLanguage(String? language) {
    setState(() {
      _selectedLanguage = language ?? "English";
      Locale newLocale = _languages.firstWhere((lang) => lang["name"] == _selectedLanguage)["locale"];
      Get.updateLocale(newLocale);
      _updateSettings('language', _selectedLanguage);
    });
  }

  void _editProfile() {
    TextEditingController nameController = TextEditingController(text: _username);
    TextEditingController emailController = TextEditingController(text: _email);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Profile"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _username = nameController.text;
                _email = emailController.text;
              });
              _updateSettings('username', _username);
              _updateSettings('email', _email);
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr),
        backgroundColor: Colors.green.shade800,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Section with Edit Button
          Card(
            elevation: 3,
            child: ListTile(
              leading: const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://lh3.googleusercontent.com/a/ACg8ocLJJiryVg_ijabC-ynTmIZU8yeHgweEBdFOo3qTB_1JQlUz1Zpp=s360-c-no'),
              ),
              title: Text(
                _username,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(_email),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: _editProfile,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Dark Mode Toggle
          SwitchListTile(
            title: Text('dark_mode'.tr),
            value: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value;
                Get.changeThemeMode(_darkMode ? ThemeMode.dark : ThemeMode.light);
                _updateSettings('darkMode', _darkMode);
              });
              widget.toggleTheme(value); // ✅ Call toggleTheme from main.dart
            },
            secondary: const Icon(Icons.dark_mode),
          ),

          // Notification Toggle
          SwitchListTile(
            title: Text('enable_notifications'.tr),
            value: _notifications,
            onChanged: (value) {
              setState(() {
                _notifications = value;
                _updateSettings('notifications', _notifications);
              });
            },
            secondary: const Icon(Icons.notifications),
          ),

          // Language Selection
          ListTile(
            title: Text('language'.tr),
            leading: const Icon(Icons.language),
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: _changeLanguage,
              items: _languages.map<DropdownMenuItem<String>>((lang) {
                return DropdownMenuItem<String>(
                  value: lang["name"],
                  child: Text(lang["name"]),
                );
              }).toList(),
            ),
          ),

          const Divider(),

          // About Section
          ListTile(
            title: Text('about_app'.tr),
            leading: const Icon(Icons.info),
            subtitle: Text('version'.tr),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "Plant Guide",
                applicationVersion: "1.0.0",
                applicationIcon: const Icon(Icons.eco, size: 40),
                children: [const Text("This app helps users identify plants and predict market trends for the plant industry. Developed by Sachintha Vidanagamage, it provides users with valuable information on plant care, identification, and market forecasts to assist both plant enthusiasts and professionals in the industry.")],
              );
            },
          ),
        ],
      ),
    );
  }
}




