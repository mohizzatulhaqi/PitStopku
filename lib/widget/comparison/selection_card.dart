import 'package:flutter/material.dart';

typedef SelectItemCallback =
    void Function(
      int position,
      BuildContext context,
      Function(Map<String, dynamic>) onItemSelected,
      String comparisonType,
      Map<String, dynamic>? selectedItem1,
      Map<String, dynamic>? selectedItem2,
      List<Map<String, dynamic>> availableDrivers,
      List<Map<String, dynamic>> availableTeams,
    );

class SelectionCard extends StatelessWidget {
  final int position;
  final Map<String, dynamic>? item;
  final String comparisonType;
  final VoidCallback onTap;

  const SelectionCard({
    super.key,
    required this.position,
    required this.item,
    required this.comparisonType,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: item != null
              ? (item!['teamColor'] as Color? ?? Colors.grey).withOpacity(0.2)
              : Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: item != null
                ? (item!['teamColor'] as Color? ?? Colors.grey).withOpacity(0.5)
                : Colors.grey.withOpacity(0.3),
          ),
        ),
        child: item != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (comparisonType == 'driver') ...[
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: item!['teamColor'] ?? Colors.grey,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          item!['number']?.toString() ?? '?',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item!['name'] ?? 'Unknown',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ] else if (item!['logoUrl'] != null) ...[
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          item!['logoUrl'],
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.flag,
                              color: Colors.white,
                              size: 16,
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item!['name'] ?? 'Unknown',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    size: 40,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Select  ${comparisonType == 'driver' ? 'driver' : 'team'}',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
