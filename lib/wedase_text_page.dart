import 'package:flutter/material.dart';

class Wudase extends StatelessWidget {
  const Wudase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ውዳሴ ማርያም ዘሰሉስ')),
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
          title: Text('1. ዉዳሴ ማርያም ዘሠሉስ'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '''
ዉዳሴሃ ለእግዝእትነ ማርያም ድንግል ወላዲተ ኣምላክ ዘይትነበብብ ዕለተ ሠሉስ።
1. አክሊለ ምክሕነ ወቀዳሚተ መድኃኒትነ ወመሰረተ ንጽሕነ ኮነ በማርያም ድንግል፡ እንተ
ወለደት ለነ ዘእግዚኣብሔር ቃለ፡ ዘኮነ ሰብኣ በእንተ መድኃኒትነ፡ እምድኃረ ኮነ ሰብአ ጥዩቀ
ኣምላክ ፍጹም ዉእቱ፡ ወበእንተዝ ወለደቶ እንዘ ደንግል ይእቲ መንክር ኃይለ ወሊዶታ
ዘኢይትነገር፡ ሰአሊ ለነ ቅድስት።
                 ''',
                style: TextStyle(fontSize: 16, height: 1.6),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('2. ዐቢይ'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 2. እስመ በፈቃዱ ኣቡሁ፡ ወመንፈስ ቅዱስ መጽኣ ወአድኃነነ። ዐቢይ ዉእቱ ስብሓተ
ድንግልናኪ ኦ ማርያም ድንግል ፍጽምት፡ ረከብኪ ሞገሰ እግዚኣብሔር ምስሌኪ፡ ኣንቲ
ዉእቱ ሰዋስዉ ዘርእየ ያዕቆብ እምድር ዘይበጽሕ እስከ ሰማይ፡ ወመላዕክተ እግዚኣብሔር
የዐርጉ ወይወርዱ ዉስቴታ፡ ሰአሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('3. ዕጽ'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 3. ኣንቲ ውእቱ ዕጽ ዘርእየ መሴ በነደ እሳት ወኢትውኢ፣ ዘውእቱ
ወልደ እግዚአብሔር መጽኣ ወኀደረ ውስተ ከርሥኪ፣ ወእሳተ
መለኮቱ ኢያውዓየ ሥጋኪ፣ ሰኣሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('4. ገራህት'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 4. አንቲ ዉእቱ ገራህት ዘኢተዘርአ ዉስቴታ ዘርእ፡ ወዕአ እምኔኪ ፍሬ
ሕይወት፡ አንቲ ዉእቲ መዝገብ ዘተሣየጠ ዮሴፍ፡ ወረከበ በዉስቴታ
ባሕርየ ዕንቄ ክብረ፡ ዘዉእቱ መድኃኒነ ኢየሱስ ክርስቶስ ተፀዉረ
በከርሥኪ ወወለድኪዮ ውስተ ዓለም፡ ሰኣሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('5. ተፈሥሒ ኦ ወላዲተ እግዚእ'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 5. ተፈሥሒ ኦ ወላዲተ እግዚእ ኃሤቶሙ ለመላእክት፡ ተፈሥሒ ኦ
ንጽሕት ዜናሆሙ ለነብያት፡ ተፈሥሒ እስመ ረከብኪ ሞገሰ
እግዚአብሔር ምስሌኪ፡ ተፈሥሒ እስመ ተወከፍኪ ቃሎ ለመልአክ
ፍስሐ ኩሉ ዓለም፡ ተፈሥሒ ኦ ወላዲተ ፈጣሬ ዓለም፡ ሰኣሊ ለነ
ቅድስት።
                '''),
            ),
          ],
        ),

        ExpansionTile(
          title: Text('6. ተፈሥሒ እስመ ድልወ '),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
    6. ተፈሥሒ እስመ ድልወ ተሰመይኪ፣ ኦ ወላዲተ ኣምላክ፡ ተፈሥሒ
ኦ መድኃኒታ ለሔዋን ተፈሥሒ እንተ ኣጥብውኪ ሓሊበ ለዘይሰስዮ ለኩሉ ፍጥረት፣ ተፈሥሒ ኦ ቅድስት እሞሙ ለኩሎሙ ሕያዋን፣
ናንቅዐዱ ኀቤኪ ትስአሊ
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('7. ኦ ድንግል ኦ ቅድስት፡ ኦ ወላዲተ እግዚእ፡ '),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
7. ኦ ድንግል ኦ ቅድስት፡ ኦ ወላዲተ እግዚእ፡ እስመ ወለድኪ ለነ
ንጉሥ፡ መንክር ምሥጥር ኃደረ ላዕሌኪ ለመድኃኒተ ዚአነ።ናርምም
እስመ ኢንክል ፈጽሞ ጥዓቁቀ ነኒረ፡ በእንተ ዕበዩ ለዉእቱ ገባሬ
ሠናያት በብዙኃ መንከሩ ራእይ፡ ሰኣሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('8. ቃለ ኣብ ሕያዉ '),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
8. ቃለ ኣብ ሕያዉ ዘወረደ ዉስተ ደብረ ሲና ወወሀበ ሕገ ለሙሴ፡
ወከደነ ርእሰ ደብር በጊሜ ዉጢስ ወጽልመት ወነፍስ፡ ወበድምፀ
ቃለ ኣቅርንት ይጌሥፅ ለእለ ይቀዉሙ በፍርሃት፡ ሰኣሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('9. ዉእቱኬ '),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 9. ዉእቱኬ ዘወረደ ኀቤኪ፡ ኦ ደብር ነባቢት በትሕትና
መፍቀሬ ሰብእ፡ ተሰብኣ እምኔኪ ዘእንበለ ዉላጤ ፍጹመ
ሥጋ ነባቢ ዘከማነ፡ በመንፈሰ ጥበብ ኣምላክ ኃደረ ላዕሌሃ፡
ኮነ ፍጹመ ሰብአ ከመ ያድኅኖ ወይሥረይ ኃጢአቶ ለኣዳም፡
ወያንብሮ ዉስተ ሰማያት ወያግብኦ ኀበ ዘትካት መንበሩ፡
በዕበይ ሣህሉ ወምሕረቱ። ሰኣሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('10. ዕበያ '),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 10. ዕበያ ለድንግል ኢይትከሃል ለተነግሮ እስመ እግዚእ ኃረያ፡ መጽአ
ወኃደረ ላዕሌሃ ዘየኃድር ዉስተ ብርሃን ኅበ አልቦ ዘይቀርቦ ተፀዉረ
በከርሣ ፱ተ አዉራኃ ዘኢይትረአይ ወዘኢትዓወቅ ወለደቶ ማርያም
እንዘ ድንግል ይእቲ፡ ሰኣሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('11. ዘዉእቱ '),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 11. ዘዉእቱ እብን ዘርእየ ዳኒኤል ነብይ፡ ዘተበትከ እምደብር ነዋኅ
ዘእንበለ፡ እድ፡ ዘዉእቱ ቃል ዘወፅኣ እምሓበ ኣብ መጽአ ወተሰብኣ
እምድንግል ዘእንበለ ዘርኣ ብእሲ ወኣድኃነነ፡ ሰኣሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('12. ኮንኪ '),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
  12. ኮንኪ ዓፅቀ ንጹሐ ወሙዳየ አሚን፡ ርትዕት ሃይማኖቶሙ
ለቅዱሳን ኣበዊነ፡ ኦ ንጽሕት ወላዲተ ኣምላክ ድንግል
ኅትምት ወለድኪ ለነ ቃለአብ ኢየሱስ ክርስቶስ መጽአ
ለመድኃኒትነ፡ ሰኣሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('13. አንቲ እሙ ለብርሃን '),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 13. አንቲ እሙ ለብርሃን ክብርት ወላዲት እግዚእ እንተ ፃርኪያ
ለቃል ዘኢይትረአይ፡ እምድኅረ ወለድኪ ኪያሁ ነበርኪ
በድንግልና፡ በስብሐት ወበባርኮት ያዐብዩኪ፡ ሰኣሊ ለነ ቅድስት።
                 '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('14. አይ ልሳን '),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
14. አይ ልሳን ዘይክል ነቢበ ዘይትነገር በእንቲአኪ ኦ ድንግል ንጽሕት እሙ
ለቃለ ኣብ ኮንኪ መንበሮ ለንጉሥ ለዘይፀዉርዎ ኪሩቤል፡ ናስተበፅዐኪ ኦ
ቡርክት፡ወንዘክር ስመኪ በኩሉ ትዉልደ ትዉልድ ኦ ርግብ ሠናይት እሙ
ለእግዚእነ ኢየሱስ ክርስቶስ፡ ሰኣሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('15. ተፈሥሒ ኦ ማርያም '),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 15. ተፈሥሒ ኦ ማርያም እም ወአመት፡ እስመ ለዘዉስተ ሕፅንኪ
ይሰብሕዎ መላእክት ወኪሩቤል ይሰግዳ ሎቱ በፍርሃት፡ ወሱራፌል
ዘእንበለ ጽርዓት ይሰፍሑ ክነፈሆሙ ወይብሉ፡ ዝንቱ ዉእቱ ንጉሠ
ስብሐት መጽአ ይሥረይ ኃጢአተ ዓለም በዕበየ ሣህሉ ፡ ሰኣሊ ለነ
ቅድስት፡፡
                '''),
            ),
          ],
        ),
      ],
    );
  }
}
