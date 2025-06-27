import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _selectedLanguage = 'አማርኛ';
  double _fontSize = 16;
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ቅንብሮች')),
      // body: Padding(
      //   padding: const EdgeInsebuits.all(16.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text('ቋንቋ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      //       DropdownButton<String>(
      //         value: _selectedLanguage,
      //         items: ['አማርኛ', 'English'].map((lang) {
      //           return DropdownMenuItem(
      //             value: lang,
      //             child: Text(lang),
      //           );
      //         }).toList(),
      //         onChanged: (value) {
      //           setState(() {
      //             _selectedLanguage = value!;
      //           });
      //         },
      //       ),
      //       SizedBox(height: 24),
      //
      //       Text('ፎንት መጠን', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      //       Slider(
      //         value: _fontSize,
      //         min: 12,
      //         max: 30,
      //         divisions: 9,
      //         label: '${_fontSize.round()}',
      //         onChanged: (value) {
      //           setState(() {
      //             _fontSize = value;
      //           });
      //         },
      //       ),
      //       SizedBox(height: 24),
      //
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text('የገጽታ ሁኔታ (Theme)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      //           Switch(
      //             value: _isDarkTheme,
      //             onChanged: (value) {
      //               setState(() {
      //                 _isDarkTheme = value;
      //               });
      //             },
      //           ),
      //         ],
      //       ),
      //
      //       SizedBox(height: 20),
      //       Text(
      //         'እባክዎ የሚፈልጉትን ቅንብር ይምረጡ።',
      //         style: TextStyle(fontSize: _fontSize),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
