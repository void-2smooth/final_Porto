import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio/utils/skills/skills_card.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Skills",
          style: GoogleFonts.openSans(
            fontSize: 75,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Container(
          height: 5,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        SizedBox(height: 20),

        // LayoutBuilder to adjust the number of cards per row based on screen width
        LayoutBuilder(
          builder: (context, constraints) {
            // If screen width is smaller than 600, use 2 cards per row (mobile view)
            bool isMobile = constraints.maxWidth < 600;

            return Column(
              children: [
                // First row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SkillsCard(name: 'Dart', image: 'assets/images/logos/dart.png'),
                    SkillsCard(name: 'Flutter', image: 'assets/images/logos/flutter.png'),
                    if (!isMobile) SkillsCard(name: 'Html', image: 'assets/images/logos/html.png'),
                    if (!isMobile) SkillsCard(name: 'Css', image: 'assets/images/logos/css.png'),
                  ],
                ),
                // Second row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!isMobile) SkillsCard(name: 'Firebase', image: 'assets/images/logos/firebase.png'),
                    if (!isMobile) SkillsCard(name: 'Figma', image: 'assets/images/logos/figma.png'),
                    if (!isMobile) SkillsCard(name: 'Lua', image: 'assets/images/logos/lua.png'),
                    if (!isMobile) SkillsCard(name: 'GitHub', image: 'assets/images/logos/github.png'),
                  ],
                ),
              ],
            );
          },
        ),
        SizedBox(height: 120),
      ],
    );
  }
}
