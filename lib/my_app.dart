import 'package:flutter/material.dart';
import 'home_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    // Initialize theme mode based on system settings
    _themeMode = WidgetsBinding.instance.window.platformBrightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;

    // Observe theme mode changes
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    setState(() {
      _themeMode = WidgetsBinding.instance.window.platformBrightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      themeMode: _themeMode, // Set the theme mode based on system settings
      home: MyHomePage(
        title: 'Privacy Apps',
        onThemeChanged: _toggleTheme, // Provide the callback function here
      ),
    );
  }
}
