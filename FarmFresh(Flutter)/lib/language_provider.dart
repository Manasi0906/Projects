import 'package:flutter/material.dart';
import 'translation_manager.dart';

class LanguageProvider extends ChangeNotifier {
  final TranslationManager _translationManager = TranslationManager();
  String _selectedLanguage = 'en'; // Default language is English

  String get selectedLanguage => _selectedLanguage;

  // Method to change the selected language
  void changeLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();  // Notify all listeners about the language change
  }

  // Method to translate text based on the current language
  Future<String> translateText(String text) {
    return _translationManager.translateText(text, _selectedLanguage);
  }
}
