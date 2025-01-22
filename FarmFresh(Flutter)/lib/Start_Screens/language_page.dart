// import 'package:flutter/material.dart';
// import 'package:language_page/Customer_Login_Screens/YourProfile.dart';
// import 'package:language_page/Start_Screens/info_slides.dart';

// class LangPage extends StatefulWidget {
//   const LangPage({super.key, this.initialSelectedLanguage = 'English'});

//   final String initialSelectedLanguage;

//   @override
//   State<LangPage> createState() => _LangPageState();
// }

// class _LangPageState extends State<LangPage> {
//   late String _selectedItem;
//   String? _selectedLanguage;

//   List<String> languages = [
//     'English',
//     'Hindi',
//     'Marathi',
//     'Tamil',
//     'Panjabi',
//     'More'
//   ];

//   void initState() {
//     super.initState();
//     _selectedItem = widget.initialSelectedLanguage;
//     _selectedLanguage = widget.initialSelectedLanguage;
//   }

//   void _addLanguage(String newLanguage) {
//     setState(() {
//       // Check if the language is already in the list
//       if (languages.contains(newLanguage)) {
//         _selectedItem = newLanguage;
//         _selectedLanguage = newLanguage;
//         return; // No need to add if it already exists
//       }

//       // Replace the second last element with the new language if the list is full
//       if (languages.length == 6) {
//         languages[languages.length - 2] = newLanguage;
//       } else {
//         // Add new language before the "More" option
//         languages.insert(languages.length - 1, newLanguage);
//       }

//       _selectedItem = newLanguage;
//       _selectedLanguage = newLanguage;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 170),
//               const Text(
//                 "Language",
//                 style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 height: 50,
//                 width: 300,
//                 padding: const EdgeInsets.only(left: 30, right: 30, top: 2),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Colors.white,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       _selectedItem,
//                       style: const TextStyle(fontSize: 18, color: Colors.green),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 "Choose from:",
//                 style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ),
//               Expanded(
//                 child: GridView.count(
//                   crossAxisCount: 2,
//                   padding: const EdgeInsets.only(
//                       left: 40.0, right: 40.0, top: 15, bottom: 15),
//                   childAspectRatio: 2,
//                   children: languages.map((language) => _buildLanguageOption(language)).toList(),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//                     return const InfoSlidesPage();
//                   }));
//                 },
//                 child: const Text(
//                   "Next",
//                   style: TextStyle(color: Colors.green),
//                 ),
//               ),
//               const SizedBox(
//                 height: 150,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLanguageOption(String language) {
//     return GestureDetector(
//       onTap: () async {
//         if (language == 'More') {
//           final result = await Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (context) => LanguagePage(),
//             ),
//           );
//           if (result != null && result is String) {
//             _addLanguage(result);
//           }
//         } else {
//           setState(() {
//             _selectedItem = language;
//             _selectedLanguage = language;
//           });
//         }
//       },
//       child: Container(
//         margin: const EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           color: _selectedItem == language ? Colors.green : Colors.white,
//         ),
//         child: Center(
//           child: Text(
//             language,
//             style: TextStyle(
//               color: _selectedItem == language ? Colors.white : Colors.green,
//               fontSize: 16,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:language_page/Customer_Login_Screens/YourProfile.dart';
import 'package:language_page/Start_Screens/info_slides.dart';
import 'package:language_page/language_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Translation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const LangPage(),
    );
  }
}
class LangPage extends StatefulWidget {
  const LangPage({super.key, this.initialSelectedLanguage = 'English'});

  final String initialSelectedLanguage;

  @override
  State<LangPage> createState() => _LangPageState();
}

class _LangPageState extends State<LangPage> {
  late String _selectedItem;
  String? _selectedLanguage;

  List<String> languages = [
    'English',
    'Hindi',
    'Marathi',
    'Tamil',
    'Panjabi',
    'More'
  ];

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.initialSelectedLanguage;
    _selectedLanguage = widget.initialSelectedLanguage;
  }

  void _addLanguage(String newLanguage) {
    setState(() {
      if (languages.contains(newLanguage)) {
        _selectedItem = newLanguage;
        _selectedLanguage = newLanguage;
        return;
      }
      if (languages.length == 6) {
        languages[languages.length - 2] = newLanguage;
      } else {
        languages.insert(languages.length - 1, newLanguage);
      }
      _selectedItem = newLanguage;
      _selectedLanguage = newLanguage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 170),
              const Text(
                "Language",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              Container(
                height: 50,
                width: 300,
                padding: const EdgeInsets.only(left: 30, right: 30, top: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _selectedItem,
                      style: const TextStyle(fontSize: 18, color: Colors.green),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Choose from:",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.only(
                      left: 40.0, right: 40.0, top: 15, bottom: 15),
                  childAspectRatio: 2,
                  children: languages.map((language) => _buildLanguageOption(language)).toList(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return const InfoSlidesPage();
                  }));
                },
                child: const Text(
                  "Next",
                  style: TextStyle(color: Colors.green),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String language) {
    return GestureDetector(
      onTap: () async {
        if (language == 'More') {
          final result = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => LanguagePage(),
            ),
          );
          if (result != null && result is String) {
            _addLanguage(result);
          }
        } else if (language == 'English') {
          // Add specific logic for English
     
          setState(() {
            _selectedItem = language;
            _selectedLanguage = language;
          });
               context.read<LanguageProvider>().changeLanguage('en');
          print('English selected');
        } else if (language == 'Marathi') {
          // Add specific logic for Marathi
         
          setState(() {
            _selectedItem = language;
            _selectedLanguage = language;
          });
            context.read<LanguageProvider>().changeLanguage('mr');
          print('Marathi selected');
        }else if (language == 'Hindi') {
          // Add specific logic for Marathi
         
          setState(() {
            _selectedItem = language;
            _selectedLanguage = language;
          });
            context.read<LanguageProvider>().changeLanguage('hi');
          print('hindi selected');
        }
        else if (language == 'Tamil') {
          // Add specific logic for Marathi
         
          setState(() {
            _selectedItem = language;
            _selectedLanguage = language;
          });
            context.read<LanguageProvider>().changeLanguage('ta');
          print('Tamil selected');
        }
         else {
          setState(() {
            _selectedItem = language;
            _selectedLanguage = language;
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: _selectedItem == language ? Colors.green : Colors.white,
        ),
        child: Center(
          child: Text(
            language,
            style: TextStyle(
              color: _selectedItem == language ? Colors.white : Colors.green,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
