import 'package:flutter/material.dart';
import 'fill.dart'; // Make sure this import matches your file location
import 'about.dart'; // Add this import
import 'settings.dart';
import 'calendar.dart';
import 'gitsawe_home.dart';
import 'app_settings.dart';
import 'bahrehasab_screen.dart';
import 'calendar_page.dart';
import 'bahirehasab_screen.dart';

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
              child: Text(
                'ግጻዌ አማራጮች',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('መዝገብ/ፍለጋ'),
              onTap: () => _onSelect("መዝገብ እና ፍለጋ", FillPage()),
            ),
            ListTile(
              title: Text('ዋና ገፅ'),
              onTap: () => _onSelect("ዋና", GitsaweHome()),
            ),
            ListTile(
              title: Text('ባሕረ ሃሳብ'),
              onTap: () => _onSelect("ባሕረ ሃሳብ", BahreHasabScreen()),
            ),
            ListTile(
              title: Text('ባሕረ ሃሳብ2'),
              onTap: () => _onSelect("ባሕረ ሃሳብ", BahireHasabScreen()),
            ),
            ListTile(
              title: Text('ባሕረ ሃሳብ3'),
              onTap: () => _onSelect("ባሕረ ሃሳብ", BahireHasabScreen()),
            ),
            ListTile(
              title: Text('የቀን መቁጠሪያ'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalendarPage()),
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
