import 'package:api_assignment/networking/api_networking.dart';
import 'package:api_assignment/services/setup.dart';
import 'package:api_assignment/widgets/display_posts.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatelessWidget {
  final int userId;
  const PostsScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final api = locator.get<ApiNetworking>();
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: FutureBuilder(
            future: api.getAllPosts(userId: 1),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            'userId: $userId',
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                      ...List.generate(snapshot.data!.length, (index) {
                        return DisplayPosts(post: snapshot.data![index]);
                      })
                    ],
                  ),
                );
              }
              return const Center(child: Text('No data is found'));
            }),
      ),
    ));
  }
}
