import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/services.dart';
import 'package:portifolio/utils/buttons/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  ContactsState createState() => ContactsState();
}

class ContactsState extends State<Contacts>
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

  Future<void> openInNewTab(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open the URL $url';
    }
  }

  void copyEmail() {
    Clipboard.setData(ClipboardData(text: 'jamessvv2005@gmail.com'));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Email copied to clipboard!')));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth < 600 ? 20 : 80,
          vertical: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Connect with Me",
              style: GoogleFonts.heebo(
                fontSize: screenWidth < 600 ? 36 : 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            Text(
              "Feel free to reach out to me on LinkedIn or check out my GitHub \n"
              "for more projects and contributions. Let's collaborate and \n"
              "build something amazing together!",
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: screenWidth < 600 ? 14 : 18,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  name: "LinkedIn",
                  icon: Icons.link,
                  onPressed: () {
                    openInNewTab(
                      'https://www.linkedin.com/in/james-coetzee-03b88b328/',
                    );
                  },
                ),
                const SizedBox(width: 20),
                CustomButton(
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
              onTap: copyEmail,
              child: Text(
                'Email: jamessvv2005@gmail.com',
                style: GoogleFonts.openSans(
                  fontSize: screenWidth < 600 ? 14 : 18,
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
