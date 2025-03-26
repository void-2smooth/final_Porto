import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio/utils/buttons/custom_button.dart';
import 'package:flutter/services.dart'; // <-- Add this import for Clipboard
import 'package:url_launcher/url_launcher.dart'; // <-- Add this import

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  ContactsState createState() => ContactsState();
}

class ContactsState extends State<Contacts> with SingleTickerProviderStateMixin {
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

  // Function to open URL in a new tab using url_launcher
  Future<void> openInNewTab(String url) async {
    final Uri uri = Uri.parse(url); // Ensure the URL is in Uri format
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication); // Opens in a new tab or browser window
    } else {
      throw 'Could not open the URL $url';
    }
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
    // Get screen width for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth < 600 ? 20 : 80, // Less padding on smaller screens
          vertical: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            Text(
              "Connect with Me",
              style: GoogleFonts.heebo(
                fontSize: screenWidth < 600 ? 36 : 48, // Adjust font size based on screen width
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Description
            Text(
              "Feel free to reach out to me on LinkedIn or check out my GitHub \n"
              "for more projects and contributions. Let's collaborate and \n"
              "build something amazing together!",
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: screenWidth < 600 ? 14 : 18, // Adjust font size for smaller screens
                height: 1.6,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 30),

            // Social Media Buttons (LinkedIn and GitHub)
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

            // Email (Click to Copy)
            GestureDetector(
              onTap: copyEmail, // Copy email when tapped
              child: Text(
                'Email: jamessvv2005@gmail.com',
                style: GoogleFonts.openSans(
                  fontSize: screenWidth < 600 ? 14 : 18, // Adjust font size for mobile
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
