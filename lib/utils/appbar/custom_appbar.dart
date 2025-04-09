import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio/utils/buttons/custom_button.dart';
import 'package:portifolio/utils/light_dark_mode.dart/light_dark_mode.dart';

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
    required Color backgroundColor,
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
            Text("VOID </>", style: GoogleFonts.happyMonkey(fontSize: 32)),
            Row(
              children: [
                CustomButton(
                  name: "My story",
                  icon: Icons.route,
                  onPressed: onMyStoryPressed,
                ),
                const SizedBox(width: 10),

                CustomButton(
                  name: "Skills",
                  icon: Icons.kitesurfing_rounded,
                  onPressed: onSkillsPressed,
                ),
                const SizedBox(width: 10),
                CustomButton(
                  name: "Projects",
                  icon: Icons.folder,
                  onPressed: onProjectsPressed,
                ),
                const SizedBox(width: 10),
                CustomButton(
                  name: "Contact",
                  icon: Icons.contact_emergency_sharp,
                  onPressed: onContactPressed,
                ),
                SizedBox(width: 10),
                LightDarkModeButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
