import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:language_page/Start_Screens/logo_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:language_page/language_provider.dart';

void main() async {
  // var delegate = await LocalizationDelegate.create(
  //     fallbackLocale: 'en_US',
  //     supportedLocales: ['en_US', 'es', 'fa', 'ar', 'ru']);
  // runApp(LocalizedApp(delegate, const MainApp()));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBp4Gs8VXo9tIrv5g7ZX_BcGQOqtkXCk0g",
        appId: "1:422835842108:android:112d3716ca8bdf81456739",
        messagingSenderId: "422835842108",
        projectId: "farmfreshpro-d9129",
        storageBucket: "farmfreshpro-d9129.appspot.com"),
  );
//   await FirebaseAppCheck.instance.activate(
//   webRecaptchaSiteKey: 'your-recaptcha-key',
// );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // var localizationDelegate = LocalizedApp.of(context).delegate;

    return  ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
    return const MaterialApp(
      // state: LocalizationProvider.of(context).state,
      // child: MaterialApp(
      //   localizationsDelegates: [
      //     GlobalMaterialLocalizations.delegate,
      //     GlobalWidgetsLocalizations.delegate,
      //     localizationDelegate
      //   ],
      debugShowCheckedModeBanner: false,
      home: LogoPage(),
    );
  }
      ),
    );
  }
}

