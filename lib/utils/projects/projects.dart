import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio/utils/projects/projects_card.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        SizedBox(height: 55,),
        Text(
          "Projects",
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
        ProjectsCard(
          title: 'Notes app',
          description: 'A small app im working on',
          link: "https://github.com/void-2smooth/VOID-NOTESAPP",
          isComplete: false,
          image1: 'assets/images/screenshots/Screenshot 2025-03-26 112214.png',
          image2: 'assets/images/screenshots/Screenshot 2025-03-26 112237.png', destonation: 'Github',
        ),
      ],
    );
  }
}
