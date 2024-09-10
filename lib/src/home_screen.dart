import 'package:api_project/src/all_user_screen.dart';
import 'package:api_project/src/photo_scree.dart';
import 'package:api_project/src/post_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Welcome to API',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Text(
              'All users',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'photo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'post',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ]),
        ),
        body: const TabBarView(
            children: [AllUserScreen(), PhotoScree(), PostScreen()]),
      ),
    );
  }
}
