import 'package:api_assignment/Screens.dart/Users_screen/users_creen.dart';
import 'package:api_assignment/Screens.dart/photos_screen/photos_screen.dart';
import 'package:api_assignment/Screens.dart/posts_screen/posts_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 233, 217),
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 255, 230, 204),
      title: const Text("Users API", style: TextStyle(fontWeight: FontWeight.bold),),
      bottom: const TabBar(
        labelColor:Color.fromARGB(255, 255, 153, 0),
        indicatorColor:Color.fromARGB(255, 255, 153, 0),
        tabs: [
          Text("All Users",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, ),),
          Text("Photos",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Text("User Posts",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ],
      ),
      ),
      body: const TabBarView(children: [
        UsersScreen(),
        PhotosScreen(),
        PostsScreen()
      ]),

    ));
  }
}