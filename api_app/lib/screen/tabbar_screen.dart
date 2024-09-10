import 'package:api_app/screen/photo_screen.dart';
import 'package:api_app/screen/post_screen.dart';
import 'package:api_app/screen/users_screen.dart';
import 'package:flutter/material.dart';

class TabbarScreen extends StatelessWidget {
  const TabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("API APP")),
          bottom: TabBar(tabs: [
            Icon(Icons.home),
            Icon(Icons.image),
            Icon(Icons.post_add)
          ]),
        ),
        body:
            TabBarView(children: [UsersScreen(), PhotoScreen(), PostScreen()]),
      ),
    );
  }
}
