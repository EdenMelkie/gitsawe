import 'package:flutter/material.dart';

class WudaseMaryamPage extends StatelessWidget {
  const WudaseMaryamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ውዳሴ ማርያም ዘሰኑይ')),
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
          title: Text('ውዳሴ ማርያምን ከመ ድገምዎ በፊት ይህንን ይበሉ!!!'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '''
ኦ እግዚእትየ ፍትኅኒ እማይሰሩ ለሰይጣን እሙ ለመድኅን
ወለተ ብርሃን ባርኪኒ ቀድስኒ ወአንፅኅኒ በከመ ባርክዮ
ለቅዱስ ኤፍሬም ፍቁርኪ በረከተ ፍቁር ወልድኪ ወአቡሁ
ወመንፈስ ቅዱስ ይኅድር በላዕሌየ ።
                ''',
                style: TextStyle(fontSize: 16, height: 1.6),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('1. ውዳሴ ዘሰኑይ'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 ዉዳሴሃ ለእግዝእትነ ማርያም ድንግል ወላዲተ ኣምላክ ዘይትነበብ
በዕለተ ሰኑይ።
1. ፈቀደ እግዚእ ያግዕዞ ለኣዳም ኅዙነ ወትኩዘ ልብ ወያግብኦ ኀበ
ዘትካት መንበሩ፡ ሰኣሊ ለነ ቅድስት።
               '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('2. ሠረቀ'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 2. ሠረቀ በሥጋ እምድንግል ዘእንበለ ዘርኣ ብእሲ ወኣድኃነነ።ለሔዋን
እንተ ኣስሓታ ከይሲ ፈትሓ ላዕሌሃ እግዚኣብሔር እንዘ ይብል ብዙኃ
ኣበዝኆ ለሕማምኪ ወለፃርኪ፡ ሠምረ ልቡ ኀበ ፍቅረ ሰብእ
ወኣግዐዛ፡ ሰኣሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('3. ኢየሱስ'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 3. ኢየሱስ ክርስቶስ ቃል ዘተሰብኣ ወኃደረ ላዕሌነ ወርኢነ ስብሓቱሁ
ከመ ስብሕተ ፩ዱ ዋሕድ ለኣቡሁ ሠምረ ይሣሃለነ፡ ሰኣሊ ለነ
ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('4. ርእየ'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 4. ርእየ ኢሳይያስ ነቢይ በመንፈስ ትንቢት ምሥጢሮ ለኣማኑኤል
ወበእንተዝ ጸርሐ እንዘ ይብል ሕፃን ተወልደ ለነ፡ ወልድ ተዉህበ
ለነ፡ ሰኣሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),

        ExpansionTile(
          title: Text('5. ተፈሣህ ወተኃሠይ '),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 5. ተፈሣህ ወተኃሠይ ኦ ዘመደ ዕጓለ እምሕያው እሰመ ኣፍቀሮ እግዚኣብሔር
ልዓለም፡ ወመጠወ ወልድ ዋሕደ ከመ ይሕየዉ ኩሉ ዘየኣምን ቦቱ እስከ
ለዓለም፡ ፈነወ ለነ መዝራዕቶ ልዑል፡ ሰኣሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('6. ዘሀሎ '),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
  6. ዘሀሎ ወይሄሉ ዘመጽኣ ወካዕበ ይምጽእ ኢየሱስ ክርስቶስ ቃል
ዘተሰብኣ እምኔኪ ዘእንበለ ዉላጤ፡ ኮነ ፍጹም ሰብኣ፡ ኢተበአደ
ወኢተፈልጠ በኩሉ ግብሩ ወልድ ዋሕድ፡ኣላ፩ዱ ራእይ፡ ወ፩ዱ ህላዌ
ወ፩ዱ መለኮት ዘእግዚኣብሔር ቃል፡ ሰኣሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('7. ተፈሥሒ ኦ ቤተልሔም '),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 7. ተፈሥሒ ኦ ቤተልሔም ሀገሮሙ ለነብያት እስመ በኃቤኪ ተወልደ
ክርስቶስ ዳግማይ ኣዳም ከመ ያግብኦ ለኣዳም ቀዳሚ ብእሲ እምድር
ዉስተ ገነት ይሥዐር ፍትሐ ሞት፡ ኦ ኣዳም መሬት ኣንተ ወትገብእ
ዉስተ መሬት፡ ኀበ ሀለወት ብዝኅት ኃጢኣት በህየ ትበዝኅ ጸጋ
እግዚኣብሔር፡ሰኣሊ ለነ 
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('8. ትትፌሣሕ '),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 8. ትትፌሣሕ ወትትሓሠይ ኩሉ ነፍስተ ሰብእ፡ ምስለ መላእክት ይሰብሕዎ
ለክርስቶስ ንጉሥ ይጸርሑ ወይበሉ ስብሓት ለእግዚኣብሔር በሰማያት፡ ወሰላም
በምድር ሥምረቱ ለሰብእ፡ እሰመ ሠዐረ ዘትካት ወነሠተ ምክሮ ለጸላኢ፡
ወሠጠጠ መጽሐፈ ዕዳሆሙ ለኣዳም ወለሔዋን፡ ወሰዮሙ ኣግዐዝያነ
ዘተወልደ ለነ በሀገረ ዳዊት መድኃኒነ ኢየሱስ ክርስቶስ፡ ሰኣሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('9. ብርሃን '),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 9. ብርሃን ዘበኣማን ዘያበርህ ለኩሉ ሰብእ ለእለ ይነብሩ ዉስተ ዓለም፡በእንተ
ፍቅረ ሰብእ መጸእከ ዉስተ ዓለም ወኩሉ ፍጥረት ተፈሥሐ በምጽኣትከ፡
እስመ ኣድኃንኮ ለኣዳም እምስሕተት፡ ወረሰይካ ለሔዋን ኣግዓዚተ እምፃዕረ
ሞት ወወሀብከነ መንፈሰ ልደት፡ ባረክናከ ምስለ መላእክቲከ፡ሰኣሊ ለነ
ቅድስት።
                '''),
            ),
          ],
        ),
      ],
    );
  }
}
