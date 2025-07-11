import 'package:flutter/material.dart';

class FavoriteToggleButton extends StatefulWidget {
  final String itemName;
  final bool initialFavoriteState;
  final VoidCallback? onFavoriteChanged;
  final Color? favoriteColor;
  final Color? unfavoriteColor;
  final double size;
  final Color? backgroundColor;
  final double borderRadius;
  final EdgeInsets margin;

  const FavoriteToggleButton({
    super.key,
    required this.itemName,
    this.initialFavoriteState = false,
    this.onFavoriteChanged,
    this.favoriteColor = Colors.red,
    this.unfavoriteColor = Colors.white,
    this.size = 24.0,
    this.backgroundColor,
    this.borderRadius = 100.0,
    this.margin = const EdgeInsets.all(8),
  });

  @override
  State<FavoriteToggleButton> createState() => _FavoriteToggleButtonState();
}

class _FavoriteToggleButtonState extends State<FavoriteToggleButton>
    with SingleTickerProviderStateMixin {
  late bool isFavorited;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    isFavorited = widget.initialFavoriteState;

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
    });

    // Trigger animation
    _animationController.forward().then((_) {
      _animationController.reverse();
    });

    // Show snackbar
    final message = isFavorited
        ? '${widget.itemName} added to favorites.'
        : '${widget.itemName} removed from favorites.';

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.grey[900],
        ),
      );
    }

    widget.onFavoriteChanged?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: IconButton(
              icon: Icon(
                isFavorited ? Icons.favorite : Icons.favorite_border,
                color: isFavorited
                    ? widget.favoriteColor
                    : widget.unfavoriteColor,
                size: widget.size,
              ),
              onPressed: _toggleFavorite,
            ),
          );
        },
      ),
    );
  }
}
