import 'package:api/network/network_api.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreen();
}

class _PostScreen extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: NetworkApi().getPostByUser(id: 1),
              builder: (context, requred) {
                if (requred.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (requred.hasData) {
                  final posts = requred.data;
                  return ListView.builder(
                      itemCount: posts?.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Text(
                              "post ID:${posts?[index].id}\nUserID:${posts?[index].userId}\nTitle:${posts?[index].title}\nBody:${posts?[index].body}\n"),
                        );
                      });
                }
                return const Text("error");
              })),
    );
  }
}
