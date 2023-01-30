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
      ),
      home: const HomeScreen(),
    );
  }
}
