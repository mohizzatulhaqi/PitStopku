import 'dart:ui';
import 'package:flutter/material.dart';

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
            // ignore: deprecated_member_use
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
            // ignore: deprecated_member_use
            border: Border.all(color: Colors.white.withOpacity(0.3)),
          ),
          child: Material(type: MaterialType.transparency, child: child),
        ),
      ),
    );
  }
}
