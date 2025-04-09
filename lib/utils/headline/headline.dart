import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Headline extends StatefulWidget {
  const Headline({super.key});

  @override
  State<Headline> createState() => _HeadlineState();
}

class _HeadlineState extends State<Headline> with TickerProviderStateMixin {
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _bounceAnimation = Tween<double>(begin: 0.0, end: -10.0).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
    );

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeIn));

    _fadeController.forward();
  }

  @override
  void dispose() {
    _bounceController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20.0 : 120.0,
            vertical: 50.0,
          ),
          child:
              isMobile
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Text(
                          "Hey 👋\nI'm VOID",
                          style: GoogleFonts.heebo(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Text(
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
                            color: textColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 30),
                      AnimatedBuilder(
                        animation: _bounceAnimation,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(0, _bounceAnimation.value),
                            child: child,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 20,
                                spreadRadius: 5,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/1728437402614.jpg",
                              height: 250,
                              width: 250,
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
                      Flexible(
                        flex: 2,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hey 👋\nI'm VOID",
                                style: GoogleFonts.heebo(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
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
                                  color: textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                      Flexible(
                        flex: 1,
                        child: AnimatedBuilder(
                          animation: _bounceAnimation,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(0, _bounceAnimation.value),
                              child: child,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "assets/images/1728437402614.jpg",
                                height: 500,
                                width: 500,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
        );
      },
    );
  }
}
