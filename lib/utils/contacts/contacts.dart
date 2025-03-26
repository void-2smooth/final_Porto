import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio/utils/buttons/custom_button.dart';
import 'dart:html' as html; // <-- Add this import
import 'package:flutter/services.dart'; // <-- Add this import for Clipboard

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void openInNewTab(String url) {
    html.window.open(url, '_blank');
  }

  // Function to copy email to clipboard
  void copyEmail() {
    Clipboard.setData(ClipboardData(text: 'jamessvv2005@gmail.com'));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Email copied to clipboard!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Connect with Me",
              style: GoogleFonts.heebo(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Feel free to reach out to me on LinkedIn or check out my GitHub \n"
              "for more projects and contributions. Let's collaborate and \n"
              "build something amazing together!",
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 18,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Custombutton(
                  name: "LinkedIn",
                  icon: Icons.link,
                  onPressed: () {
                    openInNewTab('https://www.linkedin.com/in/james-coetzee-03b88b328/');
                  },
                ),
                const SizedBox(width: 20),
                Custombutton(
                  name: "GitHub",
                  icon: Icons.code,
                  onPressed: () {
                    openInNewTab('https://github.com/void-2smooth');
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: copyEmail, // Copy email when tapped
              child: Text(
                'Email: jamessvv2005@gmail.com',
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
