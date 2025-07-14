import 'package:flutter/material.dart';
import 'comparison_row.dart';

class TeamComparison extends StatelessWidget {
  final Map<String, dynamic> team1;
  final Map<String, dynamic> team2;

  const TeamComparison({super.key, required this.team1, required this.team2});

  @override
  Widget build(BuildContext context) {
    final comparisons = [
      {'label': 'Team', 'key': 'name'},
      {'label': 'World Championships', 'key': 'worldChampionships'},
      {'label': 'Pole Positions', 'key': 'polePositions'},
      {'label': 'Fastest Laps', 'key': 'fastestLaps'},
    ];

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white.withOpacity(0.1),
                        border: Border.all(
                          color: team1['teamColor'] ?? Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: team1['logoUrl'] != null
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  team1['logoUrl'],
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.flag,
                                      color: Colors.white,
                                      size: 40,
                                    );
                                  },
                                ),
                              )
                            : const Icon(
                                Icons.flag,
                                color: Colors.white,
                                size: 40,
                              ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      team1['name'] ?? 'Unknown',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Container(width: 2, height: 100, color: Colors.grey[700]),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white.withOpacity(0.1),
                        border: Border.all(
                          color: team2['teamColor'] ?? Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: team2['logoUrl'] != null
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  team2['logoUrl'],
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.flag,
                                      color: Colors.white,
                                      size: 40,
                                    );
                                  },
                                ),
                              )
                            : const Icon(
                                Icons.flag,
                                color: Colors.white,
                                size: 40,
                              ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      team2['name'] ?? 'Unknown',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.withOpacity(0.3)),
          ),
          child: Column(
            children: comparisons.map((comparison) {
              final label = comparison['label'] as String;
              final key = comparison['key'] as String;
              final value1 = team1[key]?.toString() ?? 'N/A';
              final value2 = team2[key]?.toString() ?? 'N/A';
              return ComparisonRow(
                label: label,
                value1: value1,
                value2: value2,
                color1: team1['teamColor'] ?? Colors.grey,
                color2: team2['teamColor'] ?? Colors.grey,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
