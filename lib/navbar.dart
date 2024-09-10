import 'package:class_11/albums_screen.dart';
import 'package:class_11/photo_screen.dart';
import 'package:class_11/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Widget> pages = const [
    UserScreen(),
    PhotoScreen(),
    AlbumScreen(),
  ];
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
            backgroundColor: Colors.grey.shade100,
            selectedIndex: pageIndex,
            indicatorColor: const Color(0xffB9B9B9),
            onDestinationSelected: (value) {
              pageIndex = value;
              setState(() {});
            },
            destinations: const [
              NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.peopleGroup), label: ""),
              NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.photoFilm), label: ""),
              NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.mailchimp), label: ""),
            ]),
        body: pages[pageIndex]);
  }
}
