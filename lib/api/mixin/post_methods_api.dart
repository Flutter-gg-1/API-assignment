import 'dart:convert';

import 'package:api_assignment/api/constants.dart';
import 'package:api_assignment/models/post/post_model.dart';
import 'package:http/http.dart' as http;

mixin PostMethodsApi on Constants {
  Future<List<PostModel>> getAllPosts() async {
    final response = await http.get(Uri.parse(baseUrl + postsEndpoint));
    List<Map<String, dynamic>> listOfMap =
        List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();

    List<PostModel> posts = listOfMap.map((post) {
      return PostModel.fromJson(post);
    }).toList();
    return posts;
  }

  Future<List<PostModel>> getUserPosts() async {
    List<PostModel> posts = await getAllPosts();
    List<PostModel> userPosts =
        List.from(posts.where((post) => post.userId == 1));
    return userPosts;
  }
}
