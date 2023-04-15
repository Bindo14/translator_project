import 'package:flutter/material.dart';
import 'package:translator/translator.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Translate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue[600],
      ),
      home: TextTranslationScreen(),
    );
  }
}

// this is single language project codes

// void main() {
//   runApp( MaterialApp(
//
//   ));
// }
// class MyApp extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return
//
//
//       GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       translations: LocaleString(),
//       locale: Locale('en', 'US'),
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }


//
// class TranslateScreen extends StatefulWidget {
//   @override
//   _TranslateScreenState createState() => _TranslateScreenState();
// }
//
// class _TranslateScreenState extends State<TranslateScreen> {
//   final translator = GoogleTranslator();
//   String _originalText = '';
//   String _translatedText = '';
//
//   void _translateText() {
//     if (_originalText.isNotEmpty) {
//       translator.translate(_originalText, to: 'es').then((result) {
//         setState(() {
//           _translatedText = result.text;
//         });
//       }).catchError((error) {
//         print('Translation error: $error');
//       });
//     } else {
//       setState(() {
//         _translatedText = '';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Text Translator'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   _originalText = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 labelText: 'Enter text to translate',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _translateText,
//               child: Text('Translate'),
//             ),
//             SizedBox(height: 16.0),
//             Text('Translated Text:'),
//             SizedBox(height: 8.0),
//             Text(
//               _translatedText,
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


class TextTranslationScreen extends StatefulWidget {
  @override
  _TextTranslationScreenState createState() => _TextTranslationScreenState();
}

class _TextTranslationScreenState extends State<TextTranslationScreen> {
  final translator = GoogleTranslator();
  String _inputText = '';
  String _selectedSourceLanguage = 'en'; // Default source language: English
  String _selectedTargetLanguage = 'ml'; // Default target language: Spanish
  String _translatedText = '';

  TextEditingController startController = TextEditingController();



  final List<String> _languages = [
    'en', // English
    'ta', // Tamil
    'ml', // Malayalam
    'hi', // Hindi
    'ka', // kannada
    'es', // Spanish
    'fr', // French

    // Add more languages here as needed
  ];

  void _onTranslatePressed() {
    translator
        .translate(_inputText, from: _selectedSourceLanguage, to: _selectedTargetLanguage)
        .then((result) {
      setState(() {
        _translatedText = result.text;
      });
    }).catchError((error) {
      print('Translation error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
             image: DecorationImage(
                 image: AssetImage("assets/images/background.jpg"), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(8),

          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Translate from',style: TextStyle(color: Colors.black),),
                  SizedBox(width: 8.0),
                  Container(
                    width: 180,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                          colors: [
                            Colors.blue,
                            Colors.indigo,
                            Colors.blue,
                          ]
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: DropdownButton<String>(
                        dropdownColor: Colors.blue,
                        value: _selectedSourceLanguage,
                        onChanged: (value) {
                          setState(() {
                            _selectedSourceLanguage = value!;
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
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Text('Translate to'),
                  SizedBox(width: 22.0),





                  Container(
                    width: 180,
                    height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                            colors: [
                              Colors.blue,
                              Colors.indigo,
                              Colors.blue,
                            ]
                        ),
                      ),

                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: DropdownButton<String>(

                        value: _selectedTargetLanguage,
                        onChanged: (value) {
                          setState(() {
                            _selectedTargetLanguage = value!;
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
                  ),
                ],
              ),
              SizedBox(height: 20.0),

              Container(
                height: 45,

                child: TextFormField(
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.blue),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                      focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    label: Text("Input Text",style: TextStyle(color: Colors.blue),),
                    hintText: "Enter the Text"
                  ),
                 onChanged: (value){
                   setState(() {
                     _inputText = value;
                   });

                 },
                ),
              ),

              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: _onTranslatePressed,
                  child: Text('Translate'),
                ),
              ),
              SizedBox(height: 16.0),
              Text('Translated Text:'),
              SizedBox(height: 8.0),
              Text(_translatedText,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
            ],
          ),
        ),
      ),
    );
  }
}

