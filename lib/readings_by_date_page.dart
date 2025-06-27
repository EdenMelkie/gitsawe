import 'package:flutter/material.dart';

class ReadingsByDatePage extends StatelessWidget {
  final String dateString;
  final List<Map<String, dynamic>> readings;

  const ReadingsByDatePage({
    super.key,
    required this.dateString,
    required this.readings,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ንባቦች – $dateString')),
      body: readings.isEmpty
          ? Center(child: Text('በዚህ ቀን የተመዘገቡ ንባቦች የሉም።'))
          : ListView.builder(
        itemCount: readings.length,
        itemBuilder: (context, i) {
          final r = readings[i];
          return ListTile(
            title: Text('${r['readingType']} – ${r['bookName']} ${r['chapter']}:${r['verses']}'),
            subtitle: Text('ቀን: ${r['date']}'),
          );
        },
      ),
    );
  }
}
