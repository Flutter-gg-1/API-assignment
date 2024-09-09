import 'dart:convert';

import 'package:api_assignment/models/post.dart';
import 'package:api_assignment/networking/api_constants.dart';
import 'package:http/http.dart' as http;

mixin PostApiClient on ApiConstants {
  Future<List<Post>> getAllPosts({int? userId}) async {
    final http.Response response;

    if (userId != null) {
      final String userPostsEndpoint = '?userId=$userId';
      response =
          await http.get(Uri.parse('$baseurl$postsEndpoint$userPostsEndpoint'));
    } else {
      response = await http.get(Uri.parse('$baseurl$postsEndpoint'));
    }

    List postsData =
        List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();

    List<Post> posts = [];

    for (var post in postsData) {
      posts.add(Post.fromJson(post));
    }
    return posts;
  }
}
