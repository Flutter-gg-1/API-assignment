import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:api_project/model/post_model.dart';
import 'package:api_project/networking/constant_networking.dart';

mixin PostMethodApi on ConstantNetworking {
  Future <List<PostModel>> getPost({required int userId}) async {
    final response = await http.get(Uri.parse('$baseUrl$postsEndPoint'));
    final List<Map<String, dynamic>> postList =
        List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();
    List<PostModel> post = [];
    for (var element in postList) {
      if (element["userId"]==userId) {
        post.add(PostModel.fromJson(element));
      }
    }
    return post;
  }
}
