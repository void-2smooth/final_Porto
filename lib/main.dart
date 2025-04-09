import 'package:flutter/material.dart';
import 'package:portifolio/pages/home_page/home_page.dart';
import 'package:portifolio/theme_controller.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, themeMode, _) {
        return MaterialApp(
          title: 'VOID',
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {'/': (context) => const HomePage()},
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.white,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.black),
              bodyMedium: TextStyle(color: Colors.black87),
              headlineSmall: TextStyle(color: Colors.black),
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xFF121212),
            primarySwatch: Colors.blue,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white70),
              headlineSmall: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
