import 'package:flutter/material.dart';
import 'dart:html' as html;

class ProjectsCard extends StatelessWidget {
  final String title;
  final String description;
  final String link;
  final bool isComplete;
  final String image1;
  final String image2;
  final String destonation;

  const ProjectsCard({
    super.key,
    required this.title,
    required this.description,
    required this.link,
    required this.isComplete,
    required this.image1,
    required this.image2,
    required this.destonation,
  });

  void _openInNewTab(String url) {
    html.window.open(url, '_blank');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        width: screenWidth > 800 ? 650 : screenWidth * 0.95,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Status Circle Indicator
                    Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.only(right: 12, top: 5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isComplete ? Colors.green : Colors.red,
                        border: Border.all(color: Colors.black26, width: 1),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () => _openInNewTab(link),
                    child: Text(
                      destonation,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text(
                      'Status:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      isComplete ? 'Complete' : 'Not Complete',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: isComplete ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.network(
                          image1,
                          fit: BoxFit.cover,
                          width: screenWidth > 800 ? 280 : screenWidth * 0.42,
                          height: screenWidth > 800 ? 460 : screenWidth * 0.58,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.network(
                          image2,
                          fit: BoxFit.cover,
                          width: screenWidth > 800 ? 280 : screenWidth * 0.42,
                          height: screenWidth > 800 ? 460 : screenWidth * 0.58,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
