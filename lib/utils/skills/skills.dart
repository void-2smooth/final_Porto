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
        const SizedBox(height: 20),

        LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = 2; // phones

            if (constraints.maxWidth > 600) {
              crossAxisCount = 3; // Tablets
            }
            if (constraints.maxWidth > 900) {
              crossAxisCount = 4; // Desktop
            }

            return Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  SkillsCard(
                    name: 'Dart',
                    image: 'assets/images/logos/dart.png',
                  ),
                  SkillsCard(
                    name: 'Flutter',
                    image: 'assets/images/logos/flutter.png',
                  ),
                  SkillsCard(
                    name: 'Html',
                    image: 'assets/images/logos/html.png',
                  ),
                  SkillsCard(name: 'Css', image: 'assets/images/logos/css.png'),
                  SkillsCard(
                    name: 'Firebase',
                    image: 'assets/images/logos/firebase.png',
                  ),
                  SkillsCard(
                    name: 'Figma',
                    image: 'assets/images/logos/figma.png',
                  ),
                  SkillsCard(name: 'Lua', image: 'assets/images/logos/lua.png'),
                  SkillsCard(
                    name: 'GitHub',
                    image: 'assets/images/logos/github.png',
                  ),
                ],
              ),
            );
          },
        ),

        const SizedBox(height: 120),
      ],
    );
  }
}
