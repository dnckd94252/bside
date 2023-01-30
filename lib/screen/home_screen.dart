import 'package:bside/widget/home/home_screen_header.dart';
import 'package:bside/widget/home/home_screen_visual.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: const [
          HomeScreenVisual(),
        ],
      ),
      appBar: AppBar(
        title: const HomeScreenHeader(),
        centerTitle: false,
        elevation: 3,
        shadowColor: Colors.black45,
        backgroundColor: Colors.white,
      ),
    );
  }
}
