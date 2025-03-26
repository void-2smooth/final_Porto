import 'package:flutter/material.dart';
import 'package:portifolio/pages/home_page/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue, // You can customize the theme here
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false, // Disable the debug banner
      routes: {
        '/': (context) => const HomePage(),
        // Add more routes here as your app grows
      },
      initialRoute: '/',
    );
  }
}
