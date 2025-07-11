import 'package:flutter/material.dart';
import 'package:pitstop/theme/custom_colors.dart';

class ScrollToTopFAB extends StatefulWidget {
  final ScrollController scrollController;
  final double showThreshold;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconData? icon;
  final Duration animationDuration;
  final Curve animationCurve;
  final Duration scrollDuration;
  final Curve scrollCurve;

  const ScrollToTopFAB({
    super.key,
    required this.scrollController,
    this.showThreshold = 200.0,
    this.backgroundColor = customRed,
    this.foregroundColor = Colors.white,
    this.icon = Icons.arrow_upward_rounded,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.scrollDuration = const Duration(milliseconds: 500),
    this.scrollCurve = Curves.easeInOut,
  });

  @override
  State<ScrollToTopFAB> createState() => _ScrollToTopFABState();
}

class _ScrollToTopFABState extends State<ScrollToTopFAB>
    with SingleTickerProviderStateMixin {
  bool _isVisible = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: widget.animationCurve,
      ),
    );

    widget.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    _animationController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final shouldShow = widget.scrollController.offset > widget.showThreshold;

    if (shouldShow != _isVisible) {
      setState(() => _isVisible = shouldShow);

      if (shouldShow) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  void _scrollToTop() {
    widget.scrollController.animateTo(
      0,
      duration: widget.scrollDuration,
      curve: widget.scrollCurve,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: _scaleAnimation.value == 0.0
              ? const SizedBox.shrink()
              : FloatingActionButton(
                  backgroundColor: widget.backgroundColor,
                  foregroundColor: widget.foregroundColor,
                  onPressed: _scrollToTop,
                  child: Icon(widget.icon),
                ),
        );
      },
    );
  }
}

// Alternatif versi yang lebih simple tanpa animasi custom
class SimpleScrollToTopFAB extends StatefulWidget {
  final ScrollController scrollController;
  final double showThreshold;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconData? icon;

  const SimpleScrollToTopFAB({
    super.key,
    required this.scrollController,
    this.showThreshold = 200.0,
    this.backgroundColor = customRed,
    this.foregroundColor = Colors.white,
    this.icon = Icons.arrow_upward_rounded,
  });

  @override
  State<SimpleScrollToTopFAB> createState() => _SimpleScrollToTopFABState();
}

class _SimpleScrollToTopFABState extends State<SimpleScrollToTopFAB> {
  bool _showScrollToTopButton = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (widget.scrollController.offset > widget.showThreshold &&
        !_showScrollToTopButton) {
      setState(() => _showScrollToTopButton = true);
    } else if (widget.scrollController.offset <= widget.showThreshold &&
        _showScrollToTopButton) {
      setState(() => _showScrollToTopButton = false);
    }
  }

  void _scrollToTop() {
    widget.scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _showScrollToTopButton
        ? FloatingActionButton(
            backgroundColor: widget.backgroundColor,
            foregroundColor: widget.foregroundColor,
            onPressed: _scrollToTop,
            child: Icon(widget.icon),
          )
        : const SizedBox.shrink();
  }
}
