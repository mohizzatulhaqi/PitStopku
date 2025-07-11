import 'package:flutter/material.dart';

import 'package:pitstop/team_list_page.dart';
import 'package:pitstop/theme/custom_colors.dart';

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
        primarySwatch: customRed,
        fontFamily: 'F1',
        useMaterial3: false,
      ),
      home: const TeamsListPage(),
    );
  }
}
