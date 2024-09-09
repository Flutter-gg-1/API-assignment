import 'dart:convert';

import 'package:api_lab/models/post_model.dart';
import 'package:api_lab/networking/constent_networking.dart';
import 'package:http/http.dart' as http;

mixin PostsMethod on ConstentNetworking {
  Future<List<PostModel>> getAllposts() async {
    final respones = await http.get(Uri.parse("$url$postEndoint"));
    List<Map<String, dynamic>> responeAsList =
        List.from(jsonDecode(respones.body)).cast<Map<String, dynamic>>();
    List<PostModel> allPosts = [];
    for (var element in responeAsList) {
      allPosts.add(PostModel.fromJson(element));
    }
    return allPosts;
  }

  Future<List<PostModel>> getPhotoById({required int userId}) async {
    List<PostModel> allPosts = await getAllposts();
    List<PostModel> userPost = [];
    for (var element in allPosts) {
      if (element.userId == userId) {
        userPost.add(element);
      }
    }
    return userPost;
  }
}
