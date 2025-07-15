import 'package:flutter/material.dart';
import 'package:pitstop/model/teams_data.dart';
import 'package:pitstop/theme/custom_colors.dart';
import 'package:pitstop/widget/comparison/driver_comparison.dart';
import 'package:pitstop/widget/comparison/selection_card.dart';
import 'package:pitstop/widget/comparison/team_comparison.dart';

class ComparisonPage extends StatefulWidget {
  const ComparisonPage({super.key});

  @override
  State<ComparisonPage> createState() => _ComparisonPageState();
}

class _ComparisonPageState extends State<ComparisonPage> {
  Map<String, dynamic>? selectedItem1;
  Map<String, dynamic>? selectedItem2;
  String comparisonType = 'driver';

  List<Map<String, dynamic>> get availableTeams => teams;

  List<Map<String, dynamic>> get availableDrivers {
    return teams.expand((team) {
      return (team['drivers'] as List<dynamic>).map((driver) {
        return {
          ...driver as Map<String, dynamic>,
          'teamName': team['name'],
          'teamColor': team['teamColor'],
          'teamLogo': team['logoUrl'],
        };
      });
    }).toList();
  }

  void _selectItem(int position) {
    final items = comparisonType == 'driver'
        ? availableDrivers
        : availableTeams;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Text(
              'Select ${comparisonType == 'driver' ? 'Driver' : 'Team'} ${position == 1 ? '1' : '2'}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final isSelected =
                      (position == 1 && selectedItem1 == item) ||
                      (position == 2 && selectedItem2 == item);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (position == 1) {
                          selectedItem1 = item;
                        } else {
                          selectedItem2 = item;
                        }
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? (item['teamColor'] as Color? ?? Colors.grey)
                                  .withOpacity(0.3)
                            : Colors.grey[900],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? (item['teamColor'] as Color? ?? Colors.grey)
                              : Colors.grey.withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          if (comparisonType == 'driver') ...[
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: item['teamColor'] ?? Colors.grey,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  item['number']?.toString() ?? '?',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name'] ?? 'Unknown',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    item['teamName'] ?? 'Unknown Team',
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ] else ...[
                            if (item['logoUrl'] != null)
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    item['logoUrl'],
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(
                                        Icons.flag,
                                        color: Colors.white,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name'] ?? 'Unknown Team',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    item['base'] ?? 'Unknown Base',
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: customRed,
        foregroundColor: Colors.white,
        title: const Text(
          'Compare',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
              ),
              child: DropdownButton<String>(
                value: comparisonType,
                dropdownColor: Colors.grey[900],
                underline: const SizedBox(),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                style: const TextStyle(color: Colors.white, fontSize: 16),
                items: const [
                  DropdownMenuItem(
                    value: 'driver',
                    child: Text('Compare Drivers'),
                  ),
                  DropdownMenuItem(value: 'team', child: Text('Compare Teams')),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    comparisonType = newValue!;
                    selectedItem1 = null;
                    selectedItem2 = null;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: SelectionCard(
                    position: 1,
                    item: selectedItem1,
                    comparisonType: comparisonType,
                    onTap: () => _selectItem(1),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.compare_arrows, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SelectionCard(
                    position: 2,
                    item: selectedItem2,
                    comparisonType: comparisonType,
                    onTap: () => _selectItem(2),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            if (selectedItem1 != null && selectedItem2 != null)
              comparisonType == 'driver'
                  ? DriverComparison(
                      driver1: selectedItem1!,
                      driver2: selectedItem2!,
                    )
                  : TeamComparison(team1: selectedItem1!, team2: selectedItem2!)
            else
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.compare_arrows,
                      size: 60,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Select two ${comparisonType == 'driver' ? 'drivers' : 'teams'} to compare',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
