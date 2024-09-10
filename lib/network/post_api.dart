import 'package:api/model/post_model.dart';
import 'package:api/network/const_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

mixin PostApi on ConstApi {
  Future<List<PostModel>> getPostByUser({required int id}) async {
    final response = await http.get(Uri.parse("$url$postsUrl"));
    List<Map<String, dynamic>> responseData =
        List.from(jsonDecode(response.body));
    List<PostModel> posts = [];
    for (var element in responseData) {
      PostModel post = PostModel.fromJson(element);
      if (post.userId == id) {
        posts.add(post);
      }
      // posts.add(post);
    }
    return posts;
  }
}
