import 'package:translator/translator.dart';

// TranslationManager handles text translations.
class TranslationManager {
  final GoogleTranslator _translator = GoogleTranslator();

  // Translate the input text to the target language
  Future<String> translateText(String inputText, String targetLanguage) async {
    if (inputText.isNotEmpty) {
      var translation = await _translator.translate(inputText, to: targetLanguage);
      return translation.toString();
    }
    return inputText;  // Return the original text if translation fails
  }
}
