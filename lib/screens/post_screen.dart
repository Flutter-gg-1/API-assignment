import 'package:api_lab/networking/network_api.dart';
import 'package:api_lab/widgets/cards/post_card.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  final String name;
  final int userId;
  const PostScreen({super.key, required this.name, required this.userId});

  @override
  Widget build(BuildContext context) {
    final networkApi = NetworkApi();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 195, 202, 206),
      appBar: AppBar(
          forceMaterialTransparency: true,
          titleTextStyle: const TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 49, 49, 49),
              fontWeight: FontWeight.bold),
          title: Text(name)),
      body: FutureBuilder(
          future: networkApi.getPhotoById(userId: userId),
          builder: (context, post) {
            if (post.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
            }
            return ListView.builder(
                itemBuilder: (context, index) {
                  return PostCard(
                      title: post.data![index].title,
                      content: post.data![index].body);
                },
                itemCount: post.data!.length);
          }),
    );
  }
}
