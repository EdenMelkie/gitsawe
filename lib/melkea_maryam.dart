import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class MelkeaMaryamFromFile extends StatefulWidget {
  const MelkeaMaryamFromFile({super.key});

  @override
  State<MelkeaMaryamFromFile> createState() => _MelkeaMaryamFromFileState();
}

class _MelkeaMaryamFromFileState extends State<MelkeaMaryamFromFile> {
  List<String> stanzas = [];

  @override
  void initState() {
    super.initState();
    loadTextFile();
  }

  Future<void> loadTextFile() async {
    final String content =
    await rootBundle.loadString('assets/texts/melkea_maryam.txt');
    final List<String> loadedStanzas =
    content.split('\n\n'); // assuming double newline between stanzas

    setState(() {
      stanzas = loadedStanzas.where((e) => e.trim().isNotEmpty).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('መልክአ ማርያም'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: stanzas.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: stanzas.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              'መልክ ${index + 1}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  stanzas[index],
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
