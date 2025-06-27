// lib/wedase_maryam.dart
import 'package:flutter/material.dart';

class WudaseMaryam extends StatelessWidget {
  const WudaseMaryam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ውዳሴ ማርያም በልሣነ ግዕዝ'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text('1. መፅሐፉ በውስጡ የያዟቸው የመፃሕፍት ብዛት'),
            SizedBox(height: 8),
            Text('1ኛ ፡ የዘወትር ጸሎት'),
            Text('2ኛ ፡ የዕለቱን ውዳሴ ማርያም'),
            Text('3ኛ ፡ አንቀጸ ብርሃን'),
            Text('4ኛ ፡ ይዌድስዋ መላእክት'),
            Text('5ኛ ፡ መልክአ ማርያም'),
            Text('6ኛ ፡ መልክአ ኢየሱስ'),
            Text('7ኛ ፡ የግዕዝ ቁጥሮችንም ጨምሮ ይዟል።'),
          ],

        ),
      ),
    );
  }
}

/*


 */
