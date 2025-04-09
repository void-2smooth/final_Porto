import 'package:flutter/material.dart';
import 'package:portifolio/utils/appbar/custom_appbar.dart';
import 'package:portifolio/utils/footer/footer.dart';
import 'package:portifolio/utils/headline/headline.dart';
import 'package:portifolio/utils/projects/projects.dart';
import 'package:portifolio/utils/skills/skills.dart';
import 'package:portifolio/utils/contacts/contacts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final List<GlobalKey> sectionKeys = [
    GlobalKey(), // Headline
    GlobalKey(), // Skills
    GlobalKey(), // Projects
    GlobalKey(), // Contacts
    GlobalKey(), // Footer
  ];

  void scrollToSection(int index) {
    Scrollable.ensureVisible(
      sectionKeys[index].currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 1400) {
              return CustomAppbar(
                onMyStoryPressed: () => scrollToSection(0),
                onProjectsPressed: () => scrollToSection(2),
                onSkillsPressed: () => scrollToSection(1),
                onContactPressed: () => scrollToSection(3),
                backgroundColor: Colors.transparent,
              );
            } else {
              return AppBar(
                leading: Builder(
                  builder:
                      (context) => IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
              );
            }
          },
        ),
      ),
      drawer: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    child: const Text('Menu', style: TextStyle(fontSize: 24)),
                  ),
                  ListTile(
                    title: const Text('My Story'),
                    onTap: () {
                      scrollToSection(0);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Skills'),
                    onTap: () {
                      scrollToSection(1);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Projects'),
                    onTap: () {
                      scrollToSection(2);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Contact'),
                    onTap: () {
                      scrollToSection(3);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const Divider(height: 60, color: Colors.transparent),
            KeyedSubtree(key: sectionKeys[0], child: const Headline()),
            const Divider(height: 60, color: Colors.transparent),
            KeyedSubtree(key: sectionKeys[1], child: const Skills()),
            const Divider(height: 60, color: Colors.transparent),
            KeyedSubtree(key: sectionKeys[2], child: const Projects()),
            const Divider(height: 60, color: Colors.transparent),
            KeyedSubtree(key: sectionKeys[3], child: const Contacts()),
            const Divider(height: 60, color: Colors.transparent),
            KeyedSubtree(key: sectionKeys[4], child: const Footer()),
          ],
        ),
      ),
    );
  }
}
