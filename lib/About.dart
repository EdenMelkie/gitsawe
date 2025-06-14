import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ስለ መተግበሪያው')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ግጻዌ (Gitsawe)',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text(
              'ይህ መተግበሪያ የኦርቶዶክስ ቤተክርስቲያን ንዑስ መጽሐፍትን ለመዝግብና ለፍለጋ ተቀይሯል። በቀን መሰረት መልእክቶችን ማስገባትና ማሰስ ይቻላል።',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text('ደራሲ:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('ዲያቆን ኃይለማርያም እያዩ', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text('እባክዎ ለመጨመር ወይም ለጥያቄዎች እንዲነጋገሩ እንኳን ነው።',
                style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic))
          ],
        ),
      ),
    );
  }
}
