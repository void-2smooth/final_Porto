import 'package:flutter/material.dart';
import 'package:portifolio/utils/appbar/custom_appbar.dart';
import 'package:portifolio/utils/footer/footer.dart';
import 'package:portifolio/utils/headline/headline.dart';
import 'package:portifolio/utils/projects/projects.dart';
import 'package:portifolio/utils/skills/skills.dart';
import 'package:portifolio/utils/contacts/contacts.dart'; // Import the Contacts widget

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  // Create keys for each section
  final GlobalKey headlineKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();
  final GlobalKey contactsKey = GlobalKey(); // Add a key for Contacts

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            CustomAppbar(
              onMyStoryPressed: () => scrollToSection(headlineKey),
              onProjectsPressed: () => scrollToSection(projectsKey),
              onSkillsPressed: () => scrollToSection(skillsKey),
              onContactPressed: () => scrollToSection(contactKey),
            ),
            const Divider(height: 150, color: Colors.transparent),
            KeyedSubtree(key: headlineKey, child: Headline()),
            const Divider(height: 300, color: Colors.transparent),
            KeyedSubtree(key: skillsKey, child: Skills()),
            const Divider(height: 300, color: Colors.transparent),
            KeyedSubtree(key: projectsKey, child: Projects()),
            const Divider(height: 300, color: Colors.transparent),
            KeyedSubtree(key: contactsKey, child: Contacts()), // Add Contacts section
            const Divider(height: 300, color: Colors.transparent),
            KeyedSubtree(key: contactKey, child: Footer()),
          ],
        ),
      ),
    );
  }
}
