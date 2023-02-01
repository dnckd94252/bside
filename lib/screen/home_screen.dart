import 'package:bside/widget/home/home_header.dart';
import 'package:bside/widget/home/home_mandate.dart';
import 'package:bside/widget/home/home_visual.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeScreenVisual(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: HomeScreenMandate(),
            ),
          ],
        ),
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
