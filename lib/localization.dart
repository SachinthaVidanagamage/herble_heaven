import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'settings': 'Settings',
      'dark_mode': 'Dark Mode',
      'enable_notifications': 'Enable Notifications',
      'language': 'Language',
      'about_app': 'About App',
      'version': 'Version 1.0.0',
    },
    'si': {
      'settings': 'සැකසුම්',
      'dark_mode': 'අඳුරු මාදිලිය',
      'enable_notifications': 'දැනුම්දීම් සක්‍රීය කරන්න',
      'language': 'භාෂාව',
      'about_app': 'යෙදුම පිළිබඳව',
      'version': 'සංස්කරණය 1.0.0',
    },
    'ta': {
      'settings': 'அமைப்புகள்',
      'dark_mode': 'டார்க் மோட்',
      'enable_notifications': 'அறிவிப்புகளை இயக்கவும்',
      'language': 'மொழி',
      'about_app': 'ஆப்ஸ் பற்றி',
      'version': 'பதிப்பு 1.0.0',
    },
  };
}
