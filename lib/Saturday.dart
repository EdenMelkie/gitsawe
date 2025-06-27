import 'package:flutter/material.dart';

class Saturday extends StatelessWidget {
  const Saturday({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ውዳሴ ማርያም ዘቀዳሚት ሰንበት')),
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
          title: Text('1. ዉዳሴ ማርያም ዘቀዳሚት ሰንበት'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
ዉዳሴሃ ለእግዚእትነ ማርያም ድንግል ወላዲተ አምላክ ዘትነበብ በዕለተ ቀዳሚት ሰንበት።
1. ንጽሕት ወብርሕት ወቅድስት በኩሉ እንተ ሐቀፈቶ ለእግዚእ በእራኃ ወኩሉ
ፍጥረት ይትፌሥሑ ምስሌሃ እንዘ ይጸርሑ ወይብሉ፡ ሰአሊለነ ቅድስት።
               '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('2. ናስተበፅዕ'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
2. ተፈሲሒ ኦ ምልእተ ጸጋ፡ ተፈሥሒ እስመ ረከብኪ ሞገሰ፡ ተፈሥሒ
እግዚአብሔር ምስሌኪ። ናስተበፅዕ ዕበየኪ ኦ ግርምት ድንግል፡ ወንፌኑ ለኪ
ፍሥሐ ምስለ ገብርኤል መልአክ፡ እስመ እምፍሬ ከርሥኪ ኮነ መድኃኒተ
ዘመድነ፡ ወአቅረበነ ኀበ እግዚአብሔር አቡሁ፡ ሰአሊ ለነ ቅድስት። 
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('3. ከመ ከብካብ'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
3. ከመ ከብካብ ዘአልቦ ጥልቀት፡ መንፈስ ቅዱስ ኀደረ ላዕሌኪ
ወኃይለ ልዑል ጸለለኪ፡ ኦ ማርያም አማን ወለድኪ ቃለ
ወልደ አብ ዘይነብር ለዓለም መጽአ ወአድኀነነ እምኃጢአት፡
ሰአሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('4. ዘመድ'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
4. አንቲ ዉእቱ ዘመድ ዘእምሥርወ ዳዊት ወለድኪ ለነ
በሥጋ መድኃኒነ ኢየሱስ ክርስቶስ፡ ዋሕድ ቃል ዘእምአብ
ዘእምቅድመ ዓለም ህቡዕ፡ ኀብአ ርእሶ ወነሥአ እምኔኪ
አርአያ ገብር፡ ሰአሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),

        ExpansionTile(
          title: Text('5. ኮንኪ '),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 5. ኮንኪ ዳግሚተ ሰማይ ዲበ ምድር ኦ ወላዲተ አምላክ ዘእንበለ ርኩስ፡
ሠረቀ ለነ እምኔኪ ፀሐየ ጽድቅ፡ ወወለድኪዮ በከመ ትንቢት ነቢያት
ዘእንበለ ዘርእ ወኢሙስና፡ ሰአሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('6. ደብተራ '),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 
6. አንቲ ዉእቱ ደብተራ እንተ ተሰመይኪ ቅድስተ ቅዱሳን፡ ወወስቴታ
ታቦት በወርቅ ልቡጥ እምኩለሄ ወውስቴታ ጽላተ ኪዳን ወመሶበ ወርቅ
እንተ መና ኅቡእ፡ ዘዉእቱ ወልደ እግዚአብሔር መጽአ ወኀደረ ኀበ
ማርያም ድንግል፡ ዘእንበለ ርኩስ ተሰብአ እምኔሃ ቃለ አብ ወወለደቶ
ውስተ ዓለም ለንጉሠ ስብሐት፡ መጽአ ወአድኀነነ፡ ትትፌሣሕ ገነት እመ
በግዕ ነባቢ፡ ወልደ አብ ዘይነብር ለዓለም፡ መጽአ ወአድኀነነ እም
ኃጢአት፡ ሰአሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('7. ተሰመይኪ'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 7. ተሰመይኪ እመ ለክርስቶስ ንጉሥ፡ እምድኅረ ወለድኪ ኪያሁ
ነበርኪ በድንግልና በመንክር ምሥጢር ወወለድኪዮ ለአማኑኤል፡
ወበእንተዝ ዐቀበኪ እንበለ ሙስና፡ ሰአሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('8. ሰዋስዉ'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 8. አንቲ ዉእቱ ሰዋስዉ ዘርእየ ያዕቆብ እግዚአብሔር ላዕሌሁ
እስመ ፆርኪ በከርሥኪ ኅቱም ዘኢይትዓወቅ እምኩለሄ፡ ኮንኪ ለነ
ሰአሊተ ኀበ እግዚእነ ኢየሱስ ክርስቶስ ዘተሰብአ እምኔኪ በእንተ
መድኃኒትነ፡ ሰአሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('9. ናሁ እግዚእ '),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 9. ናሁ እግዚእ ወፅአ እምኔኪ ኦ ቡርክት ጽርሕ ንጽህት፡ ያድኅን ኩሎ
ዓለመ ዘፈጠረ በዕበየ ሣህሉ ንሰብሖ ወንወድሶ እስመ ዉእቱ ኄር
ወመፍቀሬ ሰብእ፡ ሰአሊ ለነ ቅድስት::
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('10. ተፈሥሒ ኦ ምልእተ ጸጋ'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
10. ተፈሥሒ ኦ ምልእተ ጸጋ ድንግል ዘእንበለ ርኩስ ልሕኩት ንጽሕት
ክብረ ኩሉ ዓለም፡ ብርሃን ዘኢትጠፍእ፡ መቅደስ ዘኢትትነሠት፡
በትረ ሃይማኖት ዘኢትጸንን፡ ምስማኮሙ ለቅዱሳን፡ ሰአሊ ለነ ኀበ
ወለድኪ ኄር መድኃኒነ ይምሐረነ ወይሣሃለነ ይሥረይ ኃጢአተነ፡
ሰአሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
      ],
    );
  }
}
