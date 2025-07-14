import 'package:flutter/material.dart';
import 'package:pitstop/model/teams_data.dart';
import 'package:pitstop/pages/team_detail_page.dart';
import 'package:pitstop/theme/custom_colors.dart';
import 'package:pitstop/widget/glass_card.dart';
import 'package:pitstop/widget/scroll_to_top_fab.dart';

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
    final isWide = MediaQuery.of(context).size.width > 600;
    final teamList = teams;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Teams'),
        centerTitle: true,
        backgroundColor: customRed,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isWide ? 48 : 16,
          vertical: 16,
        ),
        child: isWide
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.5,
                ),
                itemCount: teamList.length,
                itemBuilder: (context, index) {
                  final team = teamList[index];
                  return _buildTeamCard(team);
                },
              )
            : ListView.builder(
                itemCount: teamList.length,
                itemBuilder: (context, index) {
                  final team = teamList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _buildTeamCard(team),
                  );
                },
              ),
      ),
      floatingActionButton: ScrollToTopFAB(
        scrollController: _scrollController,
        backgroundColor: customRed,
        foregroundColor: Colors.white,
        showThreshold: 200.0,
      ),
    );
  }

  Widget _buildTeamCard(Map<String, dynamic> team) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TeamDetailPage(team: team)),
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
                  child: Hero(
                    tag: 'teamLogo_${team['name']}',
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          team['logoUrl'],
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.flag, color: Colors.white);
                          },
                        ),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TeamDetailPage(team: team),
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
    );
  }
}
