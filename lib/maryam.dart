import 'package:flutter/material.dart';

class Anqetse_Birhan extends StatelessWidget {
  const Anqetse_Birhan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('አንቀጸ ብርሃን')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: WidaseMaryamContent(),
      ),
    );
  }
}

class WidaseMaryamContent extends StatelessWidget {
  const WidaseMaryamContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ExpansionTile(
          title: Text('1. አንቀጸ ብርሃን'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
dfghjk
               '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('2. ዐሠርቱ ቃላት'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
dfgh
                '''),
            ),
          ],
        ),

      ],
    );
  }
}
