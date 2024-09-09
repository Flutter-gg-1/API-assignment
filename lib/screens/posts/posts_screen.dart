import 'package:api_test/screens/posts/post_card.dart';
import 'package:flutter/material.dart';

import '../../networking/networking_api.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final networkApi = NetworkingApi();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('POSTS',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              FutureBuilder(
                  future: networkApi.fetchPosts(),
                  builder: (context, data) {
                    return networkApi.posts.isEmpty
                        ? const CircularProgressIndicator()
                        : Expanded(
                            child: ListView(
                                children: networkApi.posts
                                    .map(
                                      (post) => InkWell(
                                        child: PostCard(post: post),
                                        onTap: () => (),
                                      ),
                                    )
                                    .toList()),
                          );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
