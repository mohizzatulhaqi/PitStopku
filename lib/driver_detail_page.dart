import 'package:flutter/material.dart';
import 'package:pitstop/widget/favorite_toggle_button.dart';
import 'dart:ui';

class GlassCard extends StatelessWidget {
  final Widget child;
  const GlassCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
          ),
          child: Material(type: MaterialType.transparency, child: child),
        ),
      ),
    );
  }
}

class DriverDetailPage extends StatefulWidget {
  final Map<String, dynamic> driver;

  const DriverDetailPage({super.key, required this.driver, required});

  @override
  State<DriverDetailPage> createState() => _DriverDetailPageState();
}

class _DriverDetailPageState extends State<DriverDetailPage> {
  bool _isDriverFavorited = false;

  @override
  void initState() {
    super.initState();
    _isDriverFavorited = false;
  }

  void _onFavoriteToggle(bool newFavoriteStatus) {
    setState(() {
      _isDriverFavorited = newFavoriteStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final teamColor = widget.driver['teamColor'] ?? Colors.grey;

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
                initialIsFavorite: _isDriverFavorited,
                onToggle: _onFavoriteToggle,
                itemName: widget.driver['name'] ?? 'This Driver',
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 4, bottom: 16),
              title: Text(
                widget.driver['name'] ?? 'Unknown Driver',
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
                          teamColor.withOpacity(0.7),
                          teamColor.withOpacity(0.5),
                          Colors.black.withOpacity(0.9),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.center,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  if (widget.driver['imageUrl'] != null)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 280,
                        height: 280,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          child: Image.network(
                            widget.driver['imageUrl'],
                            fit: BoxFit.cover,
                            alignment: const Alignment(0.0, -1.0),
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 280,
                                height: 280,
                                color: Colors.grey[700],
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 80,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    top: 90,
                    left: 20,
                    child: GlassCard(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '#',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              widget.driver['number']?.toString() ?? '?',
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (widget.driver['logoUrl'] != null)
                    Positioned(
                      top: 90,
                      left: 140,
                      child: GlassCard(
                        child: Container(
                          width: 60,
                          height: 60,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                widget.driver['logoUrl'],
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(
                                    Icons.groups,
                                    color: Colors.white,
                                    size: 30,
                                  );
                                },
                              ),
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
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.driver['name'] ?? 'Unknown Driver',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            if (widget.driver['country'] != null)
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: ClipOval(
                                  child: Image.network(
                                    widget.driver['country'],
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey[700],
                                        ),
                                        child: const Icon(
                                          Icons.flag,
                                          color: Colors.white70,
                                          size: 20,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.driver['teamFullName'] ??
                              widget.driver['teamName'] ??
                              'Unknown Team',
                          style: TextStyle(
                            fontSize: 18,
                            color: teamColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildInfoRow(
                          'Racing Number',
                          widget.driver['number']?.toString() ?? 'Unknown',
                        ),
                        _buildInfoRow(
                          'Age',
                          widget.driver['age']?.toString() ?? 'Unknown',
                        ),
                        _buildInfoRow(
                          'Date of Birth',
                          widget.driver['dateOfBirth']?.toString() ?? 'Unknown',
                        ),
                        _buildInfoRow(
                          'Place of Birth',
                          widget.driver['placeOfBirth']?.toString() ??
                              'Unknown',
                        ),
                        _buildInfoRow(
                          'World Championships',
                          widget.driver['worldChampionships']?.toString() ??
                              '0',
                        ),
                        _buildInfoRow(
                          'Podiums',
                          widget.driver['podiums']?.toString() ?? '0',
                        ),
                        _buildInfoRow(
                          'Career Points',
                          widget.driver['points']?.toString() ?? '0',
                        ),
                        _buildInfoRow(
                          'Grand Prix Entered',
                          widget.driver['races']?.toString() ?? '0',
                        ),
                        _buildInfoRow(
                          'Highest Race Finish',
                          widget.driver['highestRaceFinish']?.toString() ??
                              'Unknown',
                        ),
                        _buildInfoRow(
                          'Highest Grid Position',
                          widget.driver['highestGridPosition']?.toString() ??
                              'Unknown',
                        ),
                        _buildInfoRow(
                          'Pole Positions',
                          widget.driver['polePositions']?.toString() ?? '0',
                        ),
                        _buildInfoRow(
                          'DNFs',
                          widget.driver['dnfs']?.toString() ?? '0',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildGallerySection(teamColor),
                  const SizedBox(height: 24),
                  _buildQuotesSection(teamColor),
                  const SizedBox(height: 24),
                  if (widget.driver['biography'] != null) ...[
                    const Text(
                      'Biography',
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
                        widget.driver['biography'].toString(),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                  if (widget.driver['achievements'] != null &&
                      widget.driver['achievements'] is List) ...[
                    const Text(
                      'Career Achievements',
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...(widget.driver['achievements'] as List)
                              .map<Widget>((achievement) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 6,
                                        margin: const EdgeInsets.only(
                                          top: 8,
                                          right: 12,
                                        ),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: teamColor,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          achievement.toString(),
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16,
                                            height: 1.4,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })
                              .toList(),
                        ],
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

  Widget _buildGallerySection(Color teamColor) {
    final String? galleryImage = widget.driver['galleryImage'];

    if (galleryImage == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 2),
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: teamColor.withOpacity(0.3)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  galleryImage,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[700],
                      child: const Icon(
                        Icons.image,
                        color: Colors.white,
                        size: 60,
                      ),
                    );
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.3),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuotesSection(Color teamColor) {
    final String? quoteText = widget.driver['quote'];

    if (quoteText == null || quoteText.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 1),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: teamColor.withOpacity(0.3)),
          ),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: teamColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.format_quote, color: teamColor, size: 24),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          quoteText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            height: 1.4,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Text(
                  '- ${widget.driver['name'] ?? 'Unknown Driver'}',
                  style: TextStyle(
                    color: teamColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
