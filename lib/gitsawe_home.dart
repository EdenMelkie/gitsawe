import 'package:flutter/material.dart';

class GitsaweHome extends StatelessWidget {
  const GitsaweHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gitsawe Home')),
      body: Center(child: Text('Welcome to Gitsawe')),
    );
  }
}
