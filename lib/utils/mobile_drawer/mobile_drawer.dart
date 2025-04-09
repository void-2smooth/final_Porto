import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio/utils/light_dark_mode.dart/light_dark_mode.dart';

class MobileMenuDrawer extends StatelessWidget {
  final VoidCallback onMyStoryPressed;
  final VoidCallback onProjectsPressed;
  final VoidCallback onSkillsPressed;
  final VoidCallback onContactPressed;

  const MobileMenuDrawer({
    super.key,
    required this.onMyStoryPressed,
    required this.onProjectsPressed,
    required this.onSkillsPressed,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColor = theme.scaffoldBackgroundColor;
    final primaryColor = theme.colorScheme.primary;

    return Drawer(
      backgroundColor: bgColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: primaryColor),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'void',
                style: GoogleFonts.heebo(
                  color: theme.colorScheme.onPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
          _buildDrawerItem(
            context,
            icon: Icons.route,
            label: 'My Story',
            onTap: onMyStoryPressed,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.folder,
            label: 'Projects',
            onTap: onProjectsPressed,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.kitesurfing_rounded,
            label: 'Skills',
            onTap: onSkillsPressed,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.contact_emergency_sharp,
            label: 'Contact',
            onTap: onContactPressed,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.brightness_6,
            label: 'Toggle Theme Mode',
            onTap: () {
              //TODO: fix light and dark mode button not showing

              if (kDebugMode) {
                print("Light/Dark Mode toggled");
              }
              LightDarkModeButton();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return ListTile(
      leading: Icon(icon, color: textColor),
      title: Text(
        label,
        style: GoogleFonts.openSans(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // Close drawer
        onTap(); // Trigger the passed-in callback
      },
    );
  }
}
