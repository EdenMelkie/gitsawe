import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late Database db;
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, dynamic>> _readings = List.generate(7, (_) => {
    'readingType': '',
    'bookName': '',
    'chapter': 1,
    'verses': '',
  });
  final String _qidase = '';
  DateTime? _selectedGregorianDate;
  String _ethiopianDateString = '';

  // 1. Moved Ethiopian date conversion function to class level
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

  // 2. Fixed navigation function implementation
  void _navigateToBahireHasab() {
    if (_ethiopianDateString.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('እባክዎ ቀጥሎ ባሕረ ሐሳብ ለማስላት ቀን ይምረጡ')),
      );
      return;
    }
    // Add actual navigation logic here
    // Navigator.push(context, MaterialPageRoute(builder: (_) => BahireHasabPage(date: _ethiopianDateString)));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('ወደ ባሕረ ሐሳብ ይቀጥላል: $_ethiopianDateString')),
    );
  }

  // 3. Fixed date picker function
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
        // 4. Fixed SQL syntax with proper comma separation
        await db.execute('''
          CREATE TABLE readings (
            id INTEGER PRIMARY KEY,
            date TEXT,
            readingType1 TEXT, bookName1 TEXT, chapter1 INTEGER, verses1 TEXT,
            readingType2 TEXT, bookName2 TEXT, chapter2 INTEGER, verses2 TEXT,
            readingType3 TEXT, bookName3 TEXT, chapter3 INTEGER, verses3 TEXT,
            readingType4 TEXT, bookName4 TEXT, chapter4 INTEGER, verses4 TEXT,
            readingType5 TEXT, bookName5 TEXT, chapter5 INTEGER, verses5 TEXT,
            readingType6 TEXT, bookName6 TEXT, chapter6 INTEGER, verses6 TEXT,
            readingType7 TEXT, bookName7 TEXT, chapter7 INTEGER, verses7 TEXT,
            qidase TEXT
          )
        ''');
      },
    );
  }

  Future<void> _saveReading() async {
    if (!_formKey.currentState!.validate()) return;
    // 5. Use Ethiopian date instead of current time
    if (_ethiopianDateString.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('እባክዎ ቀን ይምረጡ')),
      );
      return;
    }

    await db.insert('readings', {
      'date': _ethiopianDateString,  // Use Ethiopian date
      for (int i = 0; i < 7; i++) ...{
        'readingType${i + 1}': _readings[i]['readingType'],
        'bookName${i + 1}': _readings[i]['bookName'],
        'chapter${i + 1}': _readings[i]['chapter'],
        'verses${i + 1}': _readings[i]['verses'],
      },
      'qidase': _qidase,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('ንባቡ በትክክል ተቀምጧል')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('የቀን ንባብ መመዝገቢያ'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.date_range),
                        label: const Text('ቀን ምረጥ'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        ),
                        onPressed: _pickDate,
                      ),
                      const SizedBox(height: 16),
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
                            const SizedBox(height: 8),
                            Text(
                              _ethiopianDateString,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: _navigateToBahireHasab,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber[700],
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                              ),
                              child: const Text('ባሕረ ሐሳብ አስላ'),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 6, offset: const Offset(0, 2)),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        'የንባብ መረጃ',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
                      ),
                      const SizedBox(height: 16),
                      for (int i = 0; i < 7; i++) ...[
                        Text('ንባብ ${i + 1}',
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
                        const SizedBox(height: 8),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'የንባብ አይነት',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.book),
                          ),
                          validator: (val) => val == null || val.isEmpty ? 'አይነቱን ያስገቡ' : null,
                          onChanged: (val) => _readings[i]['readingType'] = val,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'መጽሐፍ ስም',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.menu_book),
                          ),
                          validator: (val) => val == null || val.isEmpty ? 'መጽሐፉን ያስገቡ' : null,
                          onChanged: (val) => _readings[i]['bookName'] = val,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'ምዕራፍ',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.format_list_numbered),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'ምዕራፉን ያስገቡ';
                            }
                            if (int.tryParse(val) == null || int.parse(val) < 1) {
                              return 'ልክ ያለ ቁጥር ያስገቡ';
                            }
                            return null;
                          },
                          onChanged: (val) => _readings[i]['chapter'] = int.tryParse(val) ?? 1,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'ቁጥሮች',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.format_list_numbered_rtl),
                          ),
                          validator: (val) => val == null || val.isEmpty ? 'ቁጥሮቹን ያስገቡ' : null,
                          onChanged: (val) => _readings[i]['verses'] = val,
                        ),
                        const SizedBox(height: 20),
                      ],
                      // 7. Removed duplicate Qidase field here
                      ElevatedButton(
                        onPressed: _saveReading,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('አስቀምጥ'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}