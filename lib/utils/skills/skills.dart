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

        Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SkillsCard(name: 'Dart', image: 'assets/images/logos/dart.png'),
                SkillsCard(name: 'Flutter', image: 'assets/images/logos/flutter.png'),
                SkillsCard(name: 'Html', image: 'assets/images/logos/html.png'),
                SkillsCard(name: 'Css', image: 'assets/images/logos/css.png'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SkillsCard(name: 'Firebase', image: 'assets/images/logos/firebase.png'),
                SkillsCard(name: 'Figma', image: 'assets/images/logos/figma.png'),
                SkillsCard(name: 'Lua', image: 'assets/images/logos/lua.png'),
                SkillsCard(name: 'GitHub', image: 'assets/images/logos/github.png'),
              ],
            ),
          ],
        ),
        SizedBox(height: 120),
      ],
    );
  }
}
