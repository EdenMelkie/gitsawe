import 'package:flutter/material.dart';
import 'package:gitsawe/WidaseMaryam.dart';
import 'package:gitsawe/anqetse_birhan.dart';
import 'fill.dart'; // Make sure this import matches your file location
import 'about.dart'; // Add this import
import 'settings.dart';
import 'Sunday.dart';
import 'melkea_maryam.dart';
import 'gitsawe_home.dart';
import 'calendar_page.dart' as calendar;
import 'bahirehasab_screen.dart';
import 'calendar_gitsawe.dart' as gitsawe;
import 'wedase_maryam.dart' as myOld;
import 'wedase_text_page.dart';
import 'widase.dart';
import 'wednsday.dart';
import 'Thursday.dart';
import 'Friday.dart';
import 'Saturday.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ግጻዌ',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  Widget _currentScreen = FillPage();
  String _title = "መቀመጫ ገፅ";

  void _onSelect(String title, Widget screen) {
    setState(() {
      _title = title;
      _currentScreen = screen;
    });
    Navigator.of(context).pop(); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'ግጻዌ አማራጮች',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            ListTile(
              title: Text('መዝገብ/ፍለጋ'),
              onTap: () => _onSelect("መዝገብ እና ፍለጋ", FillPage()),
            ),
            ListTile(
              title: Text('ዋና ገፅ'),
              onTap: () => _onSelect("ዋና", GitsaweHome()),
            ),
            // ListTile(
            //   title: Text('ባሕረ ሃሳብ'),
            //   onTap: () => _onSelect("ባሕረ ሃሳብ", BahreHasabScreen()),
            // ),
            ListTile(
              title: const Text('ጸሎተ ዘወትር'),
              onTap: () => _onSelect('ጸሎተ ዘወትር', const WidaseMaryamPage()),
            ),
            ListTile(
              title: const Text('ውዳሴ ማርያም ዘሰኑይ'),
              onTap: () => _onSelect('ውዳሴ ማርያም ዘሰኑይ', const WudaseMaryamPage()),
            ),
            ListTile(
              title: const Text('ውዳሴ ማርያም ዘሰሉስ'),
              onTap: () => _onSelect('ውዳሴ ማርያም ዘሰሉስ', const Wudase()),
            ),
            ListTile(
              title: const Text('ውዳሴ ማርያም ዘረቡዕ'),
              onTap: () => _onSelect('ውዳሴ ማርያም ዘረቡዕ', const Wednsday()),
            ),
            ListTile(
              title: const Text('ውዳሴ ማርያም ዘሐሙስ'),
              onTap: () => _onSelect('ውዳሴ ማርያም ዘሐሙስ', const Thursday()),
            ),
            ListTile(
              title: const Text('ውዳሴ ማርያም ዘዓርብ'),
              onTap: () => _onSelect('ውዳሴ ማርያም ዘዓርብ', const Friday()),
            ),
            ListTile(
              title: const Text('ውዳሴ ማርያም ዘቀዳሚት ሰንበት'),
              onTap: () => _onSelect('ውዳሴ ማርያም ዘቀዳሚት ሰንበት', const Saturday()),
            ),
            ListTile(
              title: const Text('ውዳሴ ማርያም ዘሰንበተ ክርስትያን ቅድስት'),
              onTap: () => _onSelect('ውዳሴ ማርያም ዘሰንበተ ክርስትያን ቅድስት', const Sunday()),
            ),
            ListTile(
              title: const Text('አንቀጸ ብርሃን'),
              onTap: () => _onSelect('አንቀጸ ብርሃን', const Anqetse_Birhan()),
            ),
            ListTile(
              title: const Text('መልክአ ማርያም'),
              onTap: () => _onSelect('መልክአ ማርያም', const MelkeaMaryamFromFile()),
            ),
            ListTile(
              title: Text('ባሕረ ሃሳብ'),
              onTap: () => _onSelect("ባሕረ ሃሳብ", BahireHasabScreen()),
            ),
            ListTile(
              title: Text('የቀን መቁጠሪያ'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => gitsawe.CalendarPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('ባሕረ ሃሳብ'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => calendar.CalendarPage()),
                );
              },
            ),

            ListTile(
              title: Text('ቅንብሮች'),
              onTap: () => _onSelect("ቅንብሮች", SettingsPage()),
            ),

            ListTile(
              title: Text('ስለ መተግበሪያው'),
              onTap: () => _onSelect("ስለ መተግበሪያው", AboutPage()),
            ),
          ],
        ),
      ),
      body: _currentScreen,
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$title ገፅ እየተነደፈ ነው...', style: TextStyle(fontSize: 18)),
    );
  }
}
