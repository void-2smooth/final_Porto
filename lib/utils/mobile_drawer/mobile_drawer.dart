import 'package:flutter/material.dart';

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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            title: const Text('My Story'),
            leading: const Icon(Icons.route),
            onTap: onMyStoryPressed,
          ),
          ListTile(
            title: const Text('Projects'),
            leading: const Icon(Icons.folder),
            onTap: onProjectsPressed,
          ),
          ListTile(
            title: const Text('Skills'),
            leading: const Icon(Icons.kitesurfing_rounded),
            onTap: onSkillsPressed,
          ),
          ListTile(
            title: const Text('Contact'),
            leading: const Icon(Icons.contact_emergency_sharp),
            onTap: onContactPressed,
          ),
        ],
      ),
    );
  }
}
