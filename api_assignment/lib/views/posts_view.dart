import 'package:api_assignment/Networking/networking.dart';
import 'package:api_assignment/model/posts_model.dart';
import 'package:flutter/material.dart';

class PostsView extends StatelessWidget {
  final int userId;
  const PostsView({super.key, required this.userId});
  @override
  Widget build(BuildContext context) {
    final response = NetworkingApi();
    Future<List<PostsModel>> postlist = response.getPosts();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Posts",
          style: TextStyle(color: Colors.indigo),
        ),
      ),
      body: Center(
        child: SafeArea(
            child: ListView(
          children: [
            FutureBuilder(
                future: postlist,
                builder: (context, datauser) {
                  if (datauser.hasData) {
                    final userPosts = datauser.data!
                        .where((post) => post.userId == userId)
                        .toList();
                    return Column(
                        children: List.generate(userPosts.length, (int i) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Center(
                          child: ListTile(
                            title: Text(
                              userPosts[i].title,
                              style: const TextStyle(color: Colors.indigo),
                            ),
                            subtitle: Text(
                              userPosts[i].body,
                              style: const TextStyle(
                                  color: Color.fromARGB(159, 63, 81, 181)),
                            ),
                          ),
                        ),
                      );
                    }));
                  }
                  return const Center(child: CircularProgressIndicator());
                })
          ],
        )),
      ),
    );
  }
}
