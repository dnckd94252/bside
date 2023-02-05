import 'package:bside/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bside',
      theme: ThemeData(
        primaryColor: const Color(0xFF7F57EA),
        primaryColorLight: const Color(0xFF3859A9),
        splashColor: const Color(0xFFF8FAFB),
        hintColor: const Color(0xFFFDF0BA),
        highlightColor: const Color(0xFFEE9F19),
        cardColor: const Color(0xFFE7EEFE),
        hoverColor: const Color(0xFF667ED8),
      ),
      home: const HomeScreen(),
    );
  }
}