import 'package:flutter/material.dart';

class Sunday extends StatelessWidget {
  const Sunday({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ውዳሴ ማርያም ዘሰንበተ ክርስትያን ቅድስት')),
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
          title: Text('1. ዉዳሴ ማርያም ዘሰንበተ ክርስትያን ቅድስት'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
ውዳሴሃ ለእግዝእትነ ማርያም ድንግል ወላዲተ አምላክ ዘይትነበብ በዕለተ
ሰንበት ክርስቲያን ቅድስት።
1. ተሰመይኪ ፍቅርተ ኦ ቡርክት እምአንስት አንቲ ዉእቱ ዳግሚት ቀመር
እንተ ተሰመይ ቅድስተ ቅዱሳን ወዉስቴታ ጽላተ ኪዳን፡፲ቱ ቃላት እለ
ተጽሕፋ በአፃብዒሁ ለእግዚአብሔር ቀዲሙ ዜነወነ በየውጣ እንተ ይእቲ
ቀዳሜ ስሙ ለመድኃኒነ ኢየሱስ ክርስቶስ ዘተሰብአ እምኔኪ ዘእንበለ
ዉላጤ፡ወኮነ ዓራቄ ለሐዲስ ኪዳን፡ በዉኂዘ ደሙ ቅዱስ አንጽሖሙ
ለመሃይምናን ወለሕዝብ ንጹሐን፡ ሰአሊ ለነ ቅድስት።
               '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('2. ታቦት'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
              - ወበእንተዝ ናዐብየኪ ኩልነ፡ ኦ እግዝእትነ ወላዲተ አምላክ ንጽሕት
ኩሎ ጊዜ ንስእል ወናንቀዐዱ ኀቤኪ፡ ከመ ንርከብ ሣህለ በኀበ
መፍቀሬ ሰብእ።
2. ታቦት በወርቅ ልቡጥ እምኩለሄ ዘግቡር እምዕፅ ዘኢይትቅዝ
ይትሜሰል ለነ ዘእግዚአብሔር ቃለ ዘኮነ ሰብአ ዘእንበለ ፍልጠት
ወኢዉላጤ፡ መለኮት ንጹሕ ዘአልቦ ሙስና ዘዕሩይ ምስለ አብ ወቦቱ
አብሠራ ለንጽሕት፡ ዘእንበለ ዘርእ ኮነ ከማነ በኪነ ጥበቡ ቅዱስ፡
ዘተሰብአ እምነኪ ዘእንበለ ርኩስ፡ ደመረ መለኮቶ፡ ሰአሊ ለነ
ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('3. መቅደስ'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
  3. መቅደስ ዘይኬልልዋ ኪሩቤል እለ ሥዑላን በሥዕለ
እግዚአብሔር፡ ቃል ዘተሰብአ እምኔኪ ኦ ንጽሕት
ዘእንበለ ዉላጤ ኮነ ሠራዬ ኃጥአትነ ወደምሳሴ አበሳነ፡
ሰአሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('4. መሶበ ወርቅ'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 4. አንቲ ዉእቱ መሶበ ወርቅ ንፁሕ እንተ ዉስቴታ መና
ኅቡእ፡ ኅብስት ዘወረደ እምሰማያት ወሀቤ ሕይወት
ለኩሉ ዓለም፡ ሰአሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),

        ExpansionTile(
          title: Text('5. ተቅዋም '),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
 5. እንቲ ዉእቱ ተቅዋም ዘወርቅ እንተ ፆርኪ ማኅቶተ ፀዳል ኩሎ ጊዜ፡
ዘዉእቱ ብርሃኑ ለዓለም፡ ብርሃን ዘእምብርሃን ዘአልቦ ጥንት፡
አምላክ ዘእምኣምላክ ዘበአማን፡ ዘተሰብአ እምኔኪ ዘእንበለ ዉላጤ፡
ወበምጽአቱ አብርሃ ላዕሌነ ለእለ ንነብር ዉስተ ጽልመት ወጽላሎቱ
ሞት፡ ወአርአትዐ እገሪነ ዉስተ ፍኖተ ሰላም በምሥጢረ ጥበቡ
ቅዱስ፡ ሰአሊ ለነ ቅድስት።ss
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('6. ማዕጠንት'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
6. አንቲ ዉእቱ ማዕጠንት ዘወርቅ፡ እንተ ፆርኪ ፍሕመ እሳት፡ ብሩክ
ዘነሥአ እመቅደስ ዘይሠሪ ኃጢአተ ወይደመሰስ ጌጋየ፡ ዝ ዉእቱ
ዘእግዚአብሔር ቃል ዘተሰብአ እምነኪ ዘአዕረገ ለአቡሁ ርእሶ ዕጣነ ወመሥዋዕተ
ሥሙረ፡ ሰአሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('7. ርግብ ሠናይት'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
7. ተፈሥሒ ኦ ማርያም ርግብ ሠናይት፡ ዘወለድኪ ለነ ዘእግዚአብሔር
ቃለ፡ አንቲ ዉእቱ ጽጌ መዓዛ ሠናይ እንተ ሠረፀት እምሥርወ ዕሤይ፡
ሰአሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('8. በትረ አሮን'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
8. በትረ አሮን እንተ ሠረፀት ዘኢንበለ ተክል ወኢሠቀይዋ ማየ፡ ከማሃ
አንቲኒ ኦ ወላዲተ ክርስቶስ አምላክነ ዘበአማን ዘእንበለ ዘርእ መጽአ
ወአድኀነነ፡ ሰአሊ ለነ ቅድስት።
                '''),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('9. ለኪ ይደሉ'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''
9. ለኪ ይደሉ ዘእምኩሎሙ ቅዱሳን ተስአሊ ለነ ኦ ምልእተ ጸጋ አንቲ
ተዐብዪ እምሊቃነ ጳጳሳት ወፈድፋደ ትከብሪ እምነቢያት ብኪ ግርማ
ራእይ ዘየዐቢ እምግርማ ሱራፌል ወኪሩቤል፡ አንቲ በአማን ምክሐ
ዘመድነ ወሰአሊት ሕይወተ ለነፍሳቲነ ሰአሊ ለነ ኀበ እግዚእነ
ወመድኃኒነ ኢየሱስ ክርስቶስ፡ ያፅንዐነ በርትዕት ሃይማኖት ዉስተ
አሚነ ዚአሁ፡ ይጸግወነ ሣህሎ ወምሕረቶ፡ ይሥረይ ኃጢአተነ
በብዝኃ ምሕረቱ፡ ሰአሊ ለነ ቅድስት።

ወበእንተዝ ናዓብየኪ ኩልነ ኦ እግዝእትነ ወላዲተ አምላክ
ንጽሕት ኩሎ ጊዜ፡ ንስእል ወናንቀዐዱ ኀቤኪ ከመ ንርከብ
ሣህለ በኀበ መፍቀሬ ሰብእ። 

ጸሎታ ለማርያም ወስእለታ ያድኅነነ እመዓተ ወልዳ።
ጸሎታ ለማርያም ወስእለታ ለርእሰ ሊቃነ ጳጳስነ እገሌ ……….ይዕቀቦሙ እመዓተ ወልዳ። 
ጸሎታ ለማርያም ወስእለታ ለመፍቀሬ አምላክ እገሌ…………… እዕቀቦሙ እመዓተ ወልዳ። 
ጸሎታ ለማርያም ወስእለታ ለሕዝበ ክርስትያን ይዕቀቦም እብመዓተ ወልዳ። 
ጸሎታ ለማርያም ወስእለታ ለሀገረትነ ይዕቀባ እመዓተ ወልዳ።
                '''),
            ),
          ],
        ),
      ],
    );
  }
}
