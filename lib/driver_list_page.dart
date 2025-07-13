import 'package:flutter/material.dart';
import 'package:pitstop/model/teams_data.dart';
import 'package:pitstop/theme/custom_colors.dart';

class DriverListPage extends StatefulWidget {
  const DriverListPage({Key? key}) : super(key: key);

  @override
  State<DriverListPage> createState() => _DriverListPageState();
}

class _DriverListPageState extends State<DriverListPage> {
  String searchQuery = '';
  List<Map<String, dynamic>> allDrivers = [];

  @override
  void initState() {
    super.initState();
    _loadDrivers();
  }

  void _loadDrivers() {
    allDrivers.clear();
    for (var team in teams) {
      if (team['drivers'] != null && team['drivers'] is List) {
        for (var driver in team['drivers']) {
          Map<String, dynamic> driverWithTeam = Map.from(driver);
          driverWithTeam['teamName'] = team['name'];
          driverWithTeam['teamColor'] = team['teamColor'];
          driverWithTeam['teamFullName'] = team['fullName'];
          allDrivers.add(driverWithTeam);
        }
      }
    }
  }

  List<Map<String, dynamic>> get filteredDrivers {
    if (searchQuery.isEmpty) {
      return allDrivers;
    }
    return allDrivers.where((driver) {
      final name = driver['name']?.toString().toLowerCase() ?? '';
      final teamName = driver['teamName']?.toString().toLowerCase() ?? '';
      final number = driver['number']?.toString() ?? '';
      final query = searchQuery.toLowerCase();

      return name.contains(query) ||
          teamName.contains(query) ||
          number.contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: customRed,
        elevation: 0,
        title: const Text(
          'Drivers',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filteredDrivers.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Formula One 2025 Drivers',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            );
          }

          final driverIndex = index - 1;
          final driver = filteredDrivers[driverIndex];
          final teamColor = driver['teamColor'] as Color;

          bool isNewTeam =
              driverIndex == 0 ||
              filteredDrivers[driverIndex - 1]['teamName'] !=
                  driver['teamName'];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isNewTeam)
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 8, top: 6),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: teamColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: teamColor.withOpacity(0.5)),
                  ),
                  child: Text(
                    driver['teamFullName']?.toString() ??
                        driver['teamName']?.toString() ??
                        '',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: teamColor,
                    ),
                  ),
                ),

              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: teamColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: teamColor.withOpacity(0.3)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: teamColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                driver['number']?.toString() ?? '?',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  driver['name']?.toString() ??
                                      'Unknown Driver',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),

                                Text(
                                  driver['teamName']?.toString() ?? '',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: teamColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),

                                if (driver['country'] != null)
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    child: ClipOval(
                                      child: Image.network(
                                        driver['country'],
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.grey[700],
                                                ),
                                                child: const Icon(
                                                  Icons.flag,
                                                  color: Colors.white70,
                                                  size: 16,
                                                ),
                                              );
                                            },
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    if (driver['imageUrl'] != null)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          child: Image.network(
                            driver['imageUrl'],
                            width: 140,
                            height: 140,
                            fit: BoxFit.cover,
                            alignment: const Alignment(0.0, -1.0),
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 140,
                                height: 140,
                                color: Colors.grey[700],
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    Positioned(
                      right: 10,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
