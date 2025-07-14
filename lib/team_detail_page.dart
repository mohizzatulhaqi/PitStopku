import 'package:flutter/material.dart';
import 'package:pitstop/widget/favorite_toggle_button.dart';
import 'package:pitstop/driver_detail_page.dart';

class TeamDetailPage extends StatefulWidget {
  final Map<String, dynamic> team;

  const TeamDetailPage({super.key, required this.team});

  @override
  State<TeamDetailPage> createState() => _TeamDetailPageState();
}

class _TeamDetailPageState extends State<TeamDetailPage> {
  bool _isTeamFavorited = false;

  @override
  void initState() {
    super.initState();
    _isTeamFavorited = false;
  }

  void _onFavoriteToggle(bool newFavoriteStatus) {
    setState(() {
      _isTeamFavorited = newFavoriteStatus;
    });
  }

  void _navigateToDriverDetail(Map<String, dynamic> driver) {
    final driverWithTeam = {
      ...driver,
      'teamColor': widget.team['teamColor'],
      'teamName': widget.team['name'],
      'teamFullName': widget.team['fullName'],
    };
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DriverDetailPage(driver: driverWithTeam),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final teamColor = widget.team['teamColor'] ?? Colors.grey;

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: teamColor,
            foregroundColor: Colors.white,
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            actions: [
              FavoriteToggleButton(
                initialIsFavorite: _isTeamFavorited,
                onToggle: _onFavoriteToggle,
                itemName: widget.team['name'] ?? 'This Team',
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 4, bottom: 16),
              title: Text(
                widget.team['name'] ?? 'Unknown Team',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 3,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          teamColor.withOpacity(0.8),
                          teamColor.withOpacity(0.4),
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  if (widget.team['carUrl'] != null)
                    Positioned(
                      right: 50,
                      bottom: 20,
                      child: Transform.scale(
                        scale: 1.2,
                        child: Image.network(
                          widget.team['carUrl'],
                          fit: BoxFit.contain,
                          width: 300,
                          height: 150,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox();
                          },
                        ),
                      ),
                    ),
                  if (widget.team['logoUrl'] != null)
                    Positioned(
                      top: 100,
                      left: 150,
                      child: Hero(
                        tag: 'teamLogo_${widget.team['name']}',
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white.withOpacity(0.2),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              widget.team['logoUrl'],
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
                      ),
                    ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: teamColor.withOpacity(0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.team['fullName'] ??
                              widget.team['name'] ??
                              'Unknown Team',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Based in ${widget.team['base'] ?? 'Unknown'}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildInfoRow(
                          'Team Chief',
                          widget.team['teamChief'] ?? 'Unknown',
                        ),
                        _buildInfoRow(
                          'Technical Chief',
                          widget.team['technicalChief'] ?? 'Unknown',
                        ),
                        _buildInfoRow(
                          'Chassis',
                          widget.team['chassis'] ?? 'Unknown',
                        ),
                        _buildInfoRow(
                          'Power Unit',
                          widget.team['powerUnit'] ?? 'Unknown',
                        ),
                        _buildInfoRow(
                          'First Entry',
                          widget.team['firstTeamEntry'] ?? 'Unknown',
                        ),
                        _buildInfoRow(
                          'World Championships',
                          widget.team['worldChampionships']?.toString() ?? '0',
                        ),
                        _buildInfoRow(
                          'Pole Positions',
                          widget.team['polePositions']?.toString() ?? '0',
                        ),
                        _buildInfoRow(
                          'Fastest Laps',
                          widget.team['fastestLaps']?.toString() ?? '0',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Drivers',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (widget.team['drivers'] != null &&
                      widget.team['drivers'] is List) ...[
                    ...(widget.team['drivers'] as List).map<Widget>((driver) {
                      final driverData = driver as Map<String, dynamic>;

                      return GestureDetector(
                        onTap: () => _navigateToDriverDetail(driverData),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: teamColor.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: teamColor.withOpacity(0.3),
                                  ),
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
                                          driverData['number']?.toString() ??
                                              '?',
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            driverData['name']?.toString() ??
                                                'Unknown Driver',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          if (driverData['country'] != null)
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
                                                  driverData['country'],
                                                  fit: BoxFit.cover,
                                                  errorBuilder:
                                                      (
                                                        context,
                                                        error,
                                                        stackTrace,
                                                      ) {
                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .grey[700],
                                                              ),
                                                          child: const Icon(
                                                            Icons.flag,
                                                            color:
                                                                Colors.white70,
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
                                    const SizedBox(width: 120),
                                  ],
                                ),
                              ),
                              if (driverData['imageUrl'] != null)
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Hero(
                                    tag: 'driverImage_${driverData['name']}',
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12),
                                      ),
                                      child: Image.network(
                                        driverData['imageUrl'],
                                        width: 140,
                                        height: 120,
                                        fit: BoxFit.cover,
                                        alignment: const Alignment(0.0, -1.0),
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                              return Container(
                                                width: 130,
                                                height: 102,
                                                color: Colors.grey,
                                                child: const Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                ),
                                              );
                                            },
                                      ),
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
                                    onPressed: () =>
                                        _navigateToDriverDetail(driverData),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ] else ...[
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      ),
                      child: const Center(
                        child: Text(
                          'Driver information not available',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 24),
                  if (widget.team['description'] != null) ...[
                    const Text(
                      'Team History',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: teamColor.withOpacity(0.3)),
                      ),
                      child: Text(
                        widget.team['description'],
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              label,
              style: TextStyle(color: Colors.grey[400], fontSize: 16),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
