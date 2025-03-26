import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsCard extends StatefulWidget {
  const SkillsCard({super.key, required this.name, required this.image});

  final String name;
  final String image;

  @override
  SkillsCardState createState() => SkillsCardState();
}

class SkillsCardState extends State<SkillsCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovering = true),
        onExit: (_) => setState(() => _isHovering = false),
        child: AnimatedScale(
          scale: _isHovering ? 1.1 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: Container(
            height: 180,
            width: 160,
            decoration: BoxDecoration(
              color: _isHovering
                  ? const Color.fromARGB(255, 48, 117, 235) // Darker on hover
                  : const Color.fromARGB(255, 68, 137, 255),
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(51), // 20% opacity
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Image(image: AssetImage(widget.image), height: 120, width: 100),
                Text(
                  widget.name,
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
