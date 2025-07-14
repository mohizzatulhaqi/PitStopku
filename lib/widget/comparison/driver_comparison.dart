import 'package:flutter/material.dart';
import 'comparison_row.dart';

class DriverComparison extends StatelessWidget {
  final Map<String, dynamic> driver1;
  final Map<String, dynamic> driver2;

  const DriverComparison({
    super.key,
    required this.driver1,
    required this.driver2,
  });

  @override
  Widget build(BuildContext context) {
    final comparisons = [
      {'label': 'Team', 'key': 'teamName'},
      {'label': 'World Championships', 'key': 'worldChampionships'},
      {'label': 'Podiums', 'key': 'podiums'},
      {'label': 'Career Points', 'key': 'points'},
      {'label': 'Grand Prix Entered', 'key': 'races'},
      {'label': 'Pole Positions', 'key': 'polePositions'},
      {'label': 'Highest Race Finish', 'key': 'highestRaceFinish'},
      {'label': 'Highest Grid Position', 'key': 'highestGridPosition'},
      {'label': 'DNFs', 'key': 'dnfs'},
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: driver1['teamColor'] ?? Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          driver1['imageUrl'],
                          fit: BoxFit.cover,
                          alignment: const Alignment(1, -1.0),
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[700],
                              child: const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 60,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 40,
                      child: Center(
                        child: Text(
                          driver1['name'] ?? 'Unknown',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Container(width: 2, height: 100, color: Colors.grey[700]),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: driver2['teamColor'] ?? Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          driver2['imageUrl'],
                          fit: BoxFit.cover,
                          alignment: const Alignment(1, -1.0),
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[700],
                              child: const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 60,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 40,
                      child: Center(
                        child: Text(
                          driver2['name'] ?? 'Unknown',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ),
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
              final value1 = driver1[key]?.toString() ?? 'N/A';
              final value2 = driver2[key]?.toString() ?? 'N/A';
              return ComparisonRow(
                label: label,
                value1: value1,
                value2: value2,
                color1: driver1['teamColor'] ?? Colors.grey,
                color2: driver2['teamColor'] ?? Colors.grey,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
