// calendar_page.dart
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'bahirehasab_screen.dart';

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

  // Ethiopian Calendar conversion
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ውሂቡ በትክክል ተቀመጠ።')),
      );

      // Clear form after successful save
      _formKey.currentState?.reset();
      setState(() {
        _readingType = '';
        _bookName = '';
        _chapter = 1;
        _verses = '';
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('እባክዎ ቀንን ይምረጡ እና ቅጽን ያስገቡ።')),
      );
    }
  }

  void _navigateToBahireHasab() {
    if (_ethiopianDateString.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('እባክዎ ቀጥሎ ባሕረ ሐሳብ ለማስላት ቀን ይምረጡ')),
      );
      return;
    }

    final parts = _ethiopianDateString.split('-');
    if (parts.length != 3) return;

    final year = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final day = int.tryParse(parts[2]);

    if (year == null || month == null || day == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BahireHasabScreen(
          initialYear: year,
          initialMonth: month,
          initialDay: day,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('የቀን መቁጠሪያ'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Date selection section
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'ቀን መምረጫ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton.icon(
                          icon: Icon(Icons.date_range),
                          label: Text('ቀን ምረጥ'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[700],
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                          ),
                          onPressed: _pickDate,
                        ),
                        SizedBox(height: 16),
                        if (_ethiopianDateString.isNotEmpty)
                          Column(
                            children: [
                              Text(
                                'የኢትዮጵያ ቀን:',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                _ethiopianDateString,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                              ),
                              SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: _navigateToBahireHasab,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber[700],
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                                ),
                                child: Text('ባሕረ ሐሳብ አስላ'),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // Reading input section
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'የንባብ መረጃ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'የንባብ አይነት (ለምሳሌ፡ ዕለታዊ)',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.book),
                          ),
                          validator:
                              (val) => val == null || val.isEmpty ? 'አይነቱን ያስገቡ' : null,
                          onChanged: (val) => _readingType = val,
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'መጽሐፍ ስም (ለምሳሌ፡ ዘፍጥረት)',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.menu_book),
                          ),
                          validator:
                              (val) => val == null || val.isEmpty ? 'መጽሐፉን ያስገቡ' : null,
                          onChanged: (val) => _bookName = val,
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'ምዕራፍ',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.format_list_numbered),
                          ),
                          keyboardType: TextInputType.number,
                          validator:
                              (val) => val == null || val.isEmpty ? 'ምዕራፉን ያስገቡ' : null,
                          onChanged: (val) => _chapter = int.tryParse(val) ?? 1,
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'ቁጥሮች (ለምሳሌ፡ 1-5)',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.format_list_numbered_rtl),
                          ),
                          validator:
                              (val) => val == null || val.isEmpty ? 'ቁጥሮቹን ያስገቡ' : null,
                          onChanged: (val) => _verses = val,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _saveReading,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                          ),
                          child: Text('ንባቡን አስቀምጥ'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}