import 'package:flutter/material.dart';
import 'package:pitstop/model/race_list.dart';
import 'package:pitstop/race_detail_page.dart';
import 'package:pitstop/theme/custom_colors.dart';
import 'package:pitstop/widget/glass_card.dart';
import 'package:pitstop/widget/scroll_to_top_fab.dart';

class RaceCalendarPage extends StatefulWidget {
  const RaceCalendarPage({super.key});

  @override
  State<RaceCalendarPage> createState() => _RaceCalendarPageState();
}

class _RaceCalendarPageState extends State<RaceCalendarPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Race Schedule'),
        centerTitle: true,
        backgroundColor: customRed,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Formula One 2025 Race Calendar',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 12),
          ...races.map((race) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: GlassCard(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        race['flagUrl']!,
                        width: 45,
                        height: 45,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.flag),
                      ),
                    ),
                  ),
                  title: Text(
                    'Round ${race['round']} • ${race['country']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        _shortenGrandPrixName(race['grandPrix'] ?? ''),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        race['date'] ?? '',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RaceDetailPage(race: race),
                      ),
                    );
                  },
                ),
              ),
            );
          }),
        ],
      ),

      floatingActionButton: ScrollToTopFAB(
        scrollController: _scrollController,
        backgroundColor: customRed,
        foregroundColor: Colors.white,
        showThreshold: 200.0,
      ),
    );
  }

  String _shortenGrandPrixName(String grandPrix) {
    String shortened = grandPrix
        .replaceAll('FORMULA 1 ', '')
        .replaceAll('ROLEX ', '')
        .replaceAll('ARAMCO ', '')
        .replaceAll('CRYPTO.COM ', '')
        .replaceAll('MSC CRUISES ', '')
        .replaceAll('GULF AIR ', '')
        .replaceAll('STC ', '')
        .replaceAll('AWS ', '')
        .replaceAll('QATAR AIRWAYS ', '')
        .replaceAll('PIRELLI ', '')
        .replaceAll('LENOVO ', '')
        .replaceAll('HEINEKEN ', '')
        .replaceAll('HEINEKEN SILVER ', '')
        .replaceAll('SINGAPORE AIRLINES ', '')
        .replaceAll('ETIHAD AIRWAYS ', '');

    return shortened;
  }
}
