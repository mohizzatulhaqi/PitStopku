import 'package:flutter/material.dart';

class ComparisonRow extends StatelessWidget {
  final String label;
  final String value1;
  final String value2;
  final Color color1;
  final Color color2;

  const ComparisonRow({
    super.key,
    required this.label,
    required this.value1,
    required this.value2,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    bool? isValue1Better;
    bool areValuesEqual = false;

    num? parseValue(String label, String value) {
      if (label == 'Highest Race Finish' || label == 'Highest Grid Position') {
        final match = RegExp(r'x(\d+)').firstMatch(value);
        if (match != null) {
          return int.tryParse(match.group(1)!);
        }
        return null;
      } else {
        return num.tryParse(value);
      }
    }

    if (value1 != 'N/A' && value2 != 'N/A') {
      final num1 = parseValue(label, value1);
      final num2 = parseValue(label, value2);

      if (num1 != null && num2 != null) {
        if (num1 == num2) {
          areValuesEqual = true;
        } else {
          if (label == 'DNFs') {
            isValue1Better = num1 < num2;
          } else if (label == 'Highest Race Finish' ||
              label == 'Highest Grid Position') {
            isValue1Better = num1 > num2;
          } else if (label == 'Career Points') {
            isValue1Better = num1 > num2;
          } else {
            isValue1Better = num1 > num2;
          }
        }
      }
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: (isValue1Better == true || areValuesEqual)
                    ? color1.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: (isValue1Better == true || areValuesEqual)
                    ? Border.all(color: color1.withOpacity(0.5))
                    : null,
              ),
              child: Text(
                breakWords(value1),
                style: TextStyle(
                  color: (isValue1Better == true || areValuesEqual)
                      ? Colors.white
                      : Colors.white70,
                  fontSize: 15,
                  fontWeight: (isValue1Better == true || areValuesEqual)
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              breakWords(label),
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: (isValue1Better == false || areValuesEqual)
                    ? color2.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: (isValue1Better == false || areValuesEqual)
                    ? Border.all(color: color2.withOpacity(0.5))
                    : null,
              ),
              child: Text(
                breakWords(value2),
                style: TextStyle(
                  color: (isValue1Better == false || areValuesEqual)
                      ? Colors.white
                      : Colors.white70,
                  fontSize: 15,
                  fontWeight: (isValue1Better == false || areValuesEqual)
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String breakWords(String text) {
  if (text.trim().contains(' ')) {
    return text.replaceAll(' ', '\n');
  }
  return text;
}
