import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'photos_screen.dart';
import 'posts_sreen.dart';
import 'users_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectIndex = 0;
  List screens = [
    const UsersScreen(),
    const PhotosScreen(),
    const PostsSreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: CrystalNavigationBar(
            curve: Curves.easeInCirc,
            selectedItemColor: const Color.fromARGB(255, 85, 30, 63),
            unselectedItemColor: Colors.white70,
            backgroundColor: Colors.black.withOpacity(0.1),
            currentIndex: selectIndex,
            onTap: (p0) {
              selectIndex = p0;
              setState(() {});
            },
            items: [
              CrystalNavigationBarItem(icon: Icons.person),
              CrystalNavigationBarItem(icon: Icons.photo_rounded),
              CrystalNavigationBarItem(icon: Icons.post_add_rounded),
            ]),
        body: screens[selectIndex]);
  }
}
