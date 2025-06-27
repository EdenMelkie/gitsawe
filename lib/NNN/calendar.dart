import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late Database db;

  final _formKey = GlobalKey<FormState>();
  String _readingType = '';
  String _bookName = '';
  int _chapter = 1;
  String _verses = '';
  DateTime? _selectedGregorianDate;
  String _ethiopianDateString = '';

  @override
  void initState() {
    super.initState();
    _initDB();
  }

  Future<void> _initDB() async {
    final dbPath = await getDatabasesPath();
    final fullPath = path.join(dbPath, 'readings.db');
    db = await openDatabase(
      fullPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE readings (
            id INTEGER PRIMARY KEY,
            date TEXT,
            readingType TEXT,
            bookName TEXT,
            chapter INTEGER,
            verses TEXT
          )
        ''');
      },
    );
  }

  // Ethiopian Calendar conversion (basic, using approximate logic)
  String convertToEthiopian(DateTime gDate) {
    int gYear = gDate.year;
    DateTime ethNewYear = DateTime(gYear, 9, (gYear % 4 == 3) ? 12 : 11);
    int deltaDays = gDate.difference(ethNewYear).inDays;

    int ethYear;
    if (deltaDays >= 0) {
      ethYear = gYear - 8;
    } else {
      ethYear = gYear - 9;
      ethNewYear = DateTime(gYear - 1, 9, ((gYear - 1) % 4 == 3) ? 12 : 11);
      deltaDays = gDate.difference(ethNewYear).inDays;
    }

    int ethMonth = deltaDays ~/ 30 + 1;
    int ethDay = deltaDays % 30 + 1;

    return '$ethYear-${ethMonth.toString().padLeft(2, '0')}-${ethDay.toString().padLeft(2, '0')}';
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedGregorianDate = picked;
        _ethiopianDateString = convertToEthiopian(picked);
      });
    }
  }

  Future<void> _saveReading() async {
    if (_formKey.currentState!.validate() && _ethiopianDateString.isNotEmpty) {
      final data = {
        'date': _ethiopianDateString,
        'readingType': _readingType,
        'bookName': _bookName,
        'chapter': _chapter,
        'verses': _verses,
      };
      await db.insert('readings', data);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('ውሂቡ በትክክል ተቀመጠ።')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('እባክዎ ቀንን ይምረጡ እና ቅጽን ያስገቡ።')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('የቀን መቁጠሪያ')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.date_range),
                  label: Text('ቀን ምረጥ'),
                  onPressed: _pickDate,
                ),
                if (_ethiopianDateString.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                    child: Text(
                      'የኢትዮጵያ ቀን: $_ethiopianDateString',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'የንባብ አይነት'),
                  validator:
                      (val) => val == null || val.isEmpty ? 'አይነቱን ያስገቡ' : null,
                  onChanged: (val) => _readingType = val,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'መጽሐፍ ስም'),
                  validator:
                      (val) => val == null || val.isEmpty ? 'መጽሐፉን ያስገቡ' : null,
                  onChanged: (val) => _bookName = val,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'ምዕራፍ'),
                  keyboardType: TextInputType.number,
                  validator:
                      (val) => val == null || val.isEmpty ? 'ምዕራፉን ያስገቡ' : null,
                  onChanged: (val) => _chapter = int.tryParse(val) ?? 1,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'ቁጥሮች (e.g. 1-5)'),
                  validator:
                      (val) => val == null || val.isEmpty ? 'ቁጥሮቹን ያስገቡ' : null,
                  onChanged: (val) => _verses = val,
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: _saveReading, child: Text('አስቀምጥ')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
