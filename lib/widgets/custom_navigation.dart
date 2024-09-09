import 'package:api_assignment/screens/photos_screen.dart';
import 'package:api_assignment/screens/users_screen.dart';
import 'package:flutter/material.dart';

class CustomNavigation extends StatefulWidget {
  const CustomNavigation({super.key});

  @override
  State<CustomNavigation> createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  late List pages;
  late List pageTitles;
  late int pageIndex;
  @override
  void initState() {
    pages = [
      const UsersScreen(),
      const PhotosScreen(),
    ];
    pageTitles = ['Users', 'Photos'];
    pageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${pageTitles[pageIndex]}',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 22, 57, 87),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        currentIndex: pageIndex,
        onTap: (index) {
          if (pageIndex != index) {
            setState(() {
              pageIndex = index;
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image_rounded),
            label: 'Photos',
          ),
        ],
      ),
    );
  }
}
