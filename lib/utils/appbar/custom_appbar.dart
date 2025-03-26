import 'package:flutter/material.dart';
import 'package:portifolio/utils/buttons/custom_button.dart';

class CustomAppbar extends StatelessWidget {
  final VoidCallback onMyStoryPressed;
  final VoidCallback onProjectsPressed;
  final VoidCallback onSkillsPressed;
  final VoidCallback onContactPressed;

  const CustomAppbar({
    super.key,
    required this.onMyStoryPressed,
    required this.onProjectsPressed,
    required this.onSkillsPressed,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SizedBox(
        height: 85,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Image(
              image: AssetImage("assets/images/VOID.png"),
              height: 150,
              width: 150,
              fit: BoxFit.contain,
            ),
            Row(
              children: [
                Custombutton(name: "My story", icon: Icons.route, onPressed: onMyStoryPressed),
                const SizedBox(width: 10),
                Custombutton(name: "Projects", icon: Icons.folder, onPressed: onProjectsPressed),
                const SizedBox(width: 10),
                Custombutton(name: "Skills", icon: Icons.kitesurfing_rounded, onPressed: onSkillsPressed),
                const SizedBox(width: 10),
                Custombutton(name: "Contact", icon: Icons.contact_emergency_sharp, onPressed: onContactPressed),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
