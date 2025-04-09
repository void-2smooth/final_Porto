import 'package:flutter/material.dart';
import 'package:portifolio/theme_controller.dart';

class LightDarkModeButton extends StatefulWidget {
  const LightDarkModeButton({super.key});

  @override
  State<LightDarkModeButton> createState() => _LightDarkModeButtonState();
}

class _LightDarkModeButtonState extends State<LightDarkModeButton> {
  bool get isDark => themeModeNotifier.value == ThemeMode.dark;

  void toggleTheme() {
    themeModeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, themeMode, _) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return RotationTransition(
              turns:
                  child.key == const ValueKey('dark')
                      ? Tween(begin: 1.0, end: 0.75).animate(animation)
                      : Tween(begin: 0.75, end: 1.0).animate(animation),
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: IconButton(
            key: ValueKey(themeMode == ThemeMode.dark ? 'dark' : 'light'),
            icon: Icon(
              themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: toggleTheme,
            tooltip:
                themeMode == ThemeMode.dark
                    ? "Switch to Light Mode"
                    : "Switch to Dark Mode",
          ),
        );
      },
    );
  }
}
