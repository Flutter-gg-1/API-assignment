import 'package:api_lab/networking/network_api.dart';
import 'package:api_lab/screens/photos_screen.dart';
import 'package:api_lab/screens/post_screen.dart';
import 'package:api_lab/widgets/cards/user_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final networkApi = NetworkApi();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 166, 177, 183),
      appBar: AppBar(
        forceMaterialTransparency: true,
        titleTextStyle: const TextStyle(
            fontSize: 25,
            color: Color.fromARGB(255, 49, 49, 49),
            fontWeight: FontWeight.bold),
        title: const Text("Users"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PhotosScreen(),
                    ));
              },
              icon: const Icon(
                Icons.photo,
                size: 30,
              ))
        ],
      ),
      body: FutureBuilder(
          future: networkApi.getAllUsers(),
          builder: (context, user) {
            if (user.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
            }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: user.data!.length,
              itemBuilder: (context, index) {
                return UserCard(
                  userName: user.data?[index].username ?? "",
                  name: user.data?[index].name ?? "",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostScreen(
                              name: user.data?[index].name ?? "",
                              userId: user.data![index].id),
                        ));
                  },
                );
              },
            );
          }),
    );
  }
}
