import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int selectIndex = 0;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 85, 30, 63),
      ),
      bottomNavigationBar: CrystalNavigationBar(
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.black.withOpacity(0.1),
          currentIndex: selectIndex,
          onTap: (p0) {
            selectIndex = p0;
          },
          items: [
            CrystalNavigationBarItem(icon: Icons.person),
            CrystalNavigationBarItem(icon: Icons.person),
            CrystalNavigationBarItem(icon: Icons.person),
          ]),
      body: Column(
        children: [],
      ),
    );
  }
}
