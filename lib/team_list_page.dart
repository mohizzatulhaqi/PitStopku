import 'package:flutter/material.dart';
import 'package:pitstop/model/teams_data.dart';
import 'package:pitstop/theme/custom_colors.dart';
import 'package:pitstop/widget/glass_card.dart';
import 'package:pitstop/widget/scroll_to_top_fab.dart';
import 'package:pitstop/team_detail_page.dart';

class TeamsListPage extends StatefulWidget {
  const TeamsListPage({super.key});

  @override
  State<TeamsListPage> createState() => _TeamsListPageState();
}

class _TeamsListPageState extends State<TeamsListPage> {
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
        title: const Text('Teams'),
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
              'Formula One 2025 Teams',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 12),
          ...teams.map((team) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TeamDetailPage(team: team),
                    ),
                  );
                },
                child: GlassCard(
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.grey.shade900.withOpacity(1.0),
                          team['teamColor'].withOpacity(0.6),
                          team['teamColor'].withOpacity(0.8),
                          team['teamColor'].withOpacity(0.3),
                        ],
                        stops: [0.0, 0.3, 0.6, 1.0],
                      ),
                      image: DecorationImage(
                        image: NetworkImage(team['carUrl']),
                        fit: BoxFit.contain,
                        alignment: Alignment.bottomRight,
                        scale: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              team['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white.withOpacity(0.2),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  team['logoUrl'],
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(Icons.flag, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.transparent,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  // Navigate to detail page (sama dengan tap gesture)
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          TeamDetailPage(team: team),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),

      floatingActionButton: ScrollToTopFAB(
        scrollController: _scrollController,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        showThreshold: 200.0,
      ),
    );
  }
}
