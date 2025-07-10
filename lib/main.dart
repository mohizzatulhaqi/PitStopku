import 'package:flutter/material.dart';
import 'package:pitstop/home_page.dart';

void main() {
  runApp(const PitStopkuApp());
}

class PitStopkuApp extends StatelessWidget {
  const PitStopkuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PitStopku',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'F1',
        useMaterial3: false,
      ),
      home: const HomePage(),
    );
  }
}
