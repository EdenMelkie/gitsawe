import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class EditReadingPage extends StatefulWidget {
  final Map<String, dynamic> reading;
  final Database db;

  const EditReadingPage({super.key, required this.reading, required this.db});

  @override
  State<EditReadingPage> createState() => _EditReadingPageState();
}

class _EditReadingPageState extends State<EditReadingPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _readingTypeController;
  late TextEditingController _bookNameController;
  late TextEditingController _chapterController;
  late TextEditingController _versesController;

  late String _date;

  @override
  void initState() {
    super.initState();

    // Extract values from the reading record and fill controllers
    _readingTypeController = TextEditingController(text: widget.reading['readingType'] ?? '');
    _bookNameController = TextEditingController(text: widget.reading['bookName'] ?? '');
    _chapterController = TextEditingController(text: widget.reading['chapter']?.toString() ?? '1');
    _versesController = TextEditingController(text: widget.reading['verses'] ?? '');

    _date = widget.reading['date'] ?? '';
  }

  @override
  void dispose() {
    _readingTypeController.dispose();
    _bookNameController.dispose();
    _chapterController.dispose();
    _versesController.dispose();
    super.dispose();
  }

  Future<void> _updateReading() async {
    if (_formKey.currentState!.validate()) {
      final updatedData = {
        'readingType': _readingTypeController.text.trim(),
        'bookName': _bookNameController.text.trim(),
        'chapter': int.tryParse(_chapterController.text) ?? 1,
        'verses': _versesController.text.trim(),
      };

      // Update the database record by ID
      await widget.db.update(
        'readings',
        updatedData,
        where: 'id = ?',
        whereArgs: [widget.reading['id']],
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ንባቡ ተሻሽሏል')),
      );

      Navigator.pop(context, true); // Optionally return true to indicate success
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ንባብ አርትዕ'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'የቀን ቀረበ: $_date',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _readingTypeController,
                decoration: const InputDecoration(
                  labelText: 'የንባብ አይነት',
                  border: OutlineInputBorder(),
                ),
                validator: (val) => val == null || val.isEmpty ? 'አይነቱን ያስገቡ' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _bookNameController,
                decoration: const InputDecoration(
                  labelText: 'መጽሐፍ ስም',
                  border: OutlineInputBorder(),
                ),
                validator: (val) => val == null || val.isEmpty ? 'መጽሐፉን ያስገቡ' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _chapterController,
                decoration: const InputDecoration(
                  labelText: 'ምዕራፍ',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (val) {
                  if (val == null || val.isEmpty) return 'ምዕራፉን ያስገቡ';
                  if (int.tryParse(val) == null || int.parse(val) < 1) return 'ልክ ያለ ቁጥር ያስገቡ';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _versesController,
                decoration: const InputDecoration(
                  labelText: 'ቁጥሮች',
                  border: OutlineInputBorder(),
                ),
                validator: (val) => val == null || val.isEmpty ? 'ቁጥሮቹን ያስገቡ' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _updateReading,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                child: const Text('ለውጥ አስቀምጥ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
