import 'package:flutter/material.dart';

class FavoriteToggleButton extends StatefulWidget {
  final bool initialIsFavorite;
  final ValueChanged<bool> onToggle;
  final String itemName;

  const FavoriteToggleButton({
    super.key,
    required this.initialIsFavorite,
    required this.onToggle,
    required this.itemName,
  });

  @override
  State<FavoriteToggleButton> createState() => _FavoriteToggleButtonState();
}

class _FavoriteToggleButtonState extends State<FavoriteToggleButton> {
  late bool isFavorited;

  @override
  void initState() {
    super.initState();
    isFavorited = widget.initialIsFavorite;
  }

  void _handleToggle() {
    setState(() {
      isFavorited = !isFavorited;
    });
    widget.onToggle(isFavorited);

    final message = isFavorited
        ? '${widget.itemName} added to favorites.'
        : '${widget.itemName} removed from favorites.';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.grey[900],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        icon: Icon(
          isFavorited ? Icons.favorite : Icons.favorite_border,
          color: isFavorited ? Colors.red : Colors.white,
        ),
        onPressed: _handleToggle,
      ),
    );
  }
}
