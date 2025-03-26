import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Powered by Flutter',
                style: TextStyle(color: Colors.blue, fontSize: 25),
              ),
              SizedBox(width: 8),
              Image.asset(
                'assets/images/logos/flutter.png',
                height: 25,
              ),
            ],
          ),
          SizedBox(height: 15),
          Text(
            '© 2025 Your Name. All rights reserved.',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          SizedBox(height: 8),
          Text(
            'Privacy Policy | Terms of Service',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
