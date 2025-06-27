import 'package:flutter/material.dart';
import '../bahirehasab.dart';

class BahreHasabScreen extends StatefulWidget {
  const BahreHasabScreen({super.key});

  @override
  _BahireHasabScreenState createState() => _BahireHasabScreenState();
}

class _BahireHasabScreenState extends State<BahreHasabScreen> {
  final Bahrehasab _calculator = Bahrehasab();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();
  bool _isCalculated = false;

  @override
  void dispose() {
    _yearController.dispose();
    _monthController.dispose();
    _dayController.dispose();
    super.dispose();
  }

  void _calculate() {
    final year = int.tryParse(_yearController.text) ?? 0;
    final month = int.tryParse(_monthController.text) ?? 0;
    final day = int.tryParse(_dayController.text) ?? 0;

    if (year <= 0 || month <= 0 || month > 13 || day <= 0 || day > 30) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('እባክዎን የትክክለኛ ቀን፣ ወር እና ዓመት ያስገቡ!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      _calculator.calculate(year, month, day);
      setState(() => _isCalculated = true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('ስሌት ላይ ስህተት ተፈጥሯል: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _reset() {
    _yearController.clear();
    _monthController.clear();
    _dayController.clear();
    _calculator.reset();
    setState(() => _isCalculated = false);
  }

  Widget _buildInputField(String hint, TextEditingController controller, {int maxLength = 4}) {
    return Expanded(
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        maxLength: maxLength,
        decoration: InputDecoration(
          hintText: hint,
          counterText: '',
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _buildResultItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.teal[700],
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ባሕረ ሐሳብ ካልኩሌተር'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'የኢትዮጵያ ቀን ያስገቡ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  _buildInputField('ዓመት', _yearController, maxLength: 4),
                  SizedBox(width: 10),
                  _buildInputField('ወር', _monthController, maxLength: 2),
                  SizedBox(width: 10),
                  _buildInputField('ቀን', _dayController, maxLength: 2),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _calculate,
                      style: ElevatedButton.styleFrom(
                        // primary: Colors.teal,
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text('አስላ'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _reset,
                      style: ElevatedButton.styleFrom(
                        // primary: Colors.grey,
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text('አጽዳ'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              if (_isCalculated) ...[
                Divider(thickness: 2, color: Colors.teal),
                Text(
                  'የባሕረ ሐሳብ ውጤቶች',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                _buildResultItem('ወንበር:', _calculator.wenber1.toString()),
                _buildResultItem('አበቅቴ:', _calculator.Abeqtie.toString()),
                _buildResultItem('መጥቅዕ:', _calculator.Metqie.toString()),
                _buildResultItem('መባጃ ሐመር:', _calculator.MebajaHamer.toString()),
                _buildResultItem('ለሊት:', _calculator.Lelit.toString()),
                _buildResultItem('ወርህ:', _calculator.Werih.toString()),
                _buildResultItem('ምዕልት:', _calculator.Mealt.toString()),
                _buildResultItem('ዕለት:', _calculator.Ilet),
                _buildResultItem('ወንጌል:', _calculator.leapYearName),
                _buildResultItem('መስከረም 1:', _calculator.sep1),
                _buildResultItem('በዓለ መጥቅዕ:', _calculator.bmt),
                _buildResultItem('ነነዌ:', _calculator.nn),
                _buildResultItem('አብይ ጾም:', _calculator.ay),
                _buildResultItem('ድርቅ:', _calculator.dz),
                _buildResultItem('ሆሣዕና:', _calculator.hn),
                _buildResultItem('ስቅለት:', _calculator.st),
                _buildResultItem('ታዕዋሱ ስላሴ:', _calculator.ta),
                _buildResultItem('ርክበ ካህናት:', _calculator.rc),
                _buildResultItem('እንተፈርስታ:', _calculator.it),
                _buildResultItem('ጰራቅሊጦስ:', _calculator.ps),
                _buildResultItem('ሆሣዕና ወርክ:', _calculator.hw),
                _buildResultItem('ደብረ ታቦር:', _calculator.dt),
                _buildResultItem('ጥምቀት:', _calculator.tir),
                _buildResultItem('መስከረም 17:', _calculator.sep17),
                _buildResultItem('መጋቢት 29:', _calculator.meg),
              ],
            ],
          ),
        ),
      ),
    );
  }
}