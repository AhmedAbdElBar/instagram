import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends StatefulWidget {
  final Widget child;
  const ThemeProvider({super.key, required this.child});

  @override
  State<ThemeProvider> createState() => _ThemeProviderState();

  static _ThemeProviderState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_ThemeInheritedWidget>()!
        .data;
  }
}

class _ThemeProviderState extends State<ThemeProvider> {
  ThemeMode themeMode = ThemeMode.dark;

  @override
  void initState() {
    super.initState();
    _loadTheme(); // Load saved theme when the app starts
  }

  Future<void> _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDark = prefs.getBool("isDarkTheme") ?? true;
    setState(() {
      themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  Future<void> toggleTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isDarkTheme", isDark);
    setState(() {
      themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _ThemeInheritedWidget(
      data: this,
      child: widget.child,
    );
  }
}

class _ThemeInheritedWidget extends InheritedWidget {
  final _ThemeProviderState data;

  const _ThemeInheritedWidget({required this.data, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
