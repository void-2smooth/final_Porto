import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Headline extends StatefulWidget {
  const Headline({super.key});

  @override
  State<Headline> createState() => _HeadlineState();
}

class _HeadlineState extends State<Headline>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.0,
      end: -10.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 50.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Check if the screen width is smaller than 600 (mobile view)
          bool isMobile = constraints.maxWidth < 600;

          return isMobile
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text Column
                  Text(
                    "Hey 👋\nI'm VOID",
                    style: GoogleFonts.heebo(
                      fontSize: 32, // Adjust font size for mobile
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "I’m a Flutter developer focused on building \n"
                    "beautiful and functional mobile apps for Android and iOS.\n"
                    "With a passion for UI/UX design, \n"
                    "I create intuitive, visually engaging user experiences.\n"
                    "I stay up to date with the latest trends to \n"
                    "ensure seamless and polished apps across platforms.\n\n"
                    "Let’s build something amazing together!",
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  // Animated Image
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _animation.value),
                        child: child,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 20,
                            spreadRadius: 5,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/1728437402614.jpg",
                          height: 250, // Adjust image size for mobile
                          width: 250, // Adjust image size for mobile
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hey 👋\nI'm VOID",
                        style: GoogleFonts.heebo(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "I’m a Flutter developer focused on building \n"
                        "beautiful and functional mobile apps for Android and iOS.\n"
                        "With a passion for UI/UX design, \n"
                        "I create intuitive, visually engaging user experiences.\n"
                        "I stay up to date with the latest trends to \n"
                        "ensure seamless and polished apps across platforms.\n\n"
                        "Let’s build something amazing together!",
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 40),
                  // Animated Image
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _animation.value),
                        child: child,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 20,
                            spreadRadius: 5,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/1728437402614.jpg",
                          height: 500, // Image size for desktop
                          width: 500, // Image size for desktop
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              );
        },
      ),
    );
  }
}
