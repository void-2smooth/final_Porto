import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.name,
    required this.icon,
    required this.onPressed,
  });

  final String name;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return TextButton.icon(
      style: TextButton.styleFrom(
        foregroundColor:
            isDark ? Colors.white : const Color.fromARGB(255, 3, 64, 170),
        backgroundColor: isDark ? Colors.blueAccent : Colors.blueAccent,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        textStyle: theme.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        overlayColor: const Color.fromARGB(255, 0, 94, 255),
      ),
      onPressed: onPressed,
      label: Text(
        name,
        style: TextStyle(
          color:
              isDark ? Colors.white : const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      icon: Icon(
        icon,
        size: 28,
        color: isDark ? Colors.white : const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
