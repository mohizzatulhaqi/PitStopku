import 'package:flutter/material.dart';
import 'package:pitstop/model/race_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PitStopku'), centerTitle: true),
      body: ListView.builder(
        itemCount: races.length,
        itemBuilder: (context, index) {
          final race = races[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  race['flagUrl']!,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.flag),
                ),
              ),
              title: Text(
                'Round ${race['round']} • ${race['country']}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(race['grandPrix'] ?? ''),
                  Text(
                    race['date'] ?? '',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Bisa diarahkan ke detail page
              },
            ),
          );
        },
      ),
    );
  }
}
