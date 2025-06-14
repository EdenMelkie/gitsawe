import 'package:flutter/material.dart';
import 'database_helper.dart';

class FillPage extends StatefulWidget {
  const FillPage({super.key});

  @override
  State<FillPage> createState() => _FillPageState();
}

class _FillPageState extends State<FillPage> {
  final _formKey = GlobalKey<FormState>();

  final _dateController = TextEditingController();
  final _paulController = TextEditingController();
  final _epistleController = TextEditingController();
  final _actsController = TextEditingController();
  final _psalmController = TextEditingController();
  final _gospelController = TextEditingController();
  final _liturgyController = TextEditingController();
  final _fetchDateController = TextEditingController();
  String _fetchedResult = '';

  Future<void> _insertData() async {
    if (_formKey.currentState!.validate()) {
      final data = {
        'ቀን': _dateController.text,
        'የጳውሎስ_መልእክት': _paulController.text,
        'መልእክት': _epistleController.text,
        'የሐዋርያት_ሥራ': _actsController.text,
        'መዝሙረ_ዳዊት': _psalmController.text,
        'ወንጌል': _gospelController.text,
        'ቅዳሴ': _liturgyController.text,
      };

      await DatabaseHelper.instance.insertData(data);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('በትክክል ታድሷል።')));
    }
  }

  Future<void> _fetchData() async {
    final date = _fetchDateController.text;
    final result = await DatabaseHelper.instance.getDataByDate(date);

    setState(() {
      if (result != null) {
        _fetchedResult = '''
ቀን: ${result['ቀን']}
የጳውሎስ መልእክት: ${result['የጳውሎስ_መልእክት']}
መልእክት: ${result['መልእክት']}
የሐዋርያት ሥራ: ${result['የሐዋርያት_ሥራ']}
መዝሙረ ዳዊት: ${result['መዝሙረ_ዳዊት']}
ወንጌል: ${result['ወንጌል']}
ቅዳሴ: ${result['ቅዳሴ']}
        ''';
      } else {
        _fetchedResult = 'ምንም ውሂብ አልተገኘም።';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gitsawe - መዝገብ እና ፍለጋ')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('🔹 መሙያ ቅጽ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildInput(_dateController, 'ቀን (e.g. 2/3/2015)'),
                  _buildInput(_paulController, 'የጳውሎስ መልእክት'),
                  _buildInput(_epistleController, 'መልእክት'),
                  _buildInput(_actsController, 'የሐዋርያት ሥራ'),
                  _buildInput(_psalmController, 'መዝሙረ ዳዊት'),
                  _buildInput(_gospelController, 'ወንጌል'),
                  _buildInput(_liturgyController, 'ቅዳሴ'),
                  SizedBox(height: 10),
                  ElevatedButton(onPressed: _insertData, child: Text('ያስገቡ')),
                ],
              ),
            ),
            Divider(height: 40),
            Text('🔍 የቀን መረጃ ፍለጋ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextField(
              controller: _fetchDateController,
              decoration: InputDecoration(labelText: 'ቀን ያስገቡ (e.g. 2/3/2015)'),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _fetchData, child: Text('ፈልግ')),
            SizedBox(height: 20),
            Text(_fetchedResult, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextFormField(
        controller: controller,
        validator: (val) => val == null || val.isEmpty ? 'እባክዎ $label ያስገቡ' : null,
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
      ),
    );
  }
}
