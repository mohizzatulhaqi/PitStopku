import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> races = const [
    {'name': 'British GP', 'date': '2025-07-06', 'location': 'Silverstone'},
    {'name': 'Hungarian GP', 'date': '2025-07-20', 'location': 'Hungaroring'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PitStopku'), centerTitle: true),
      body: ListView.builder(
        itemCount: races.length,
        itemBuilder: (context, index) {
          final race = races[index];
          return ListTile(
            title: Text(race['name'] ?? ''),
            subtitle: Text('${race['location']} • ${race['date']}'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          );
        },
      ),
    );
  }
}
