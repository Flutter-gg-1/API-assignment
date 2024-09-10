import 'dart:convert';

import 'package:api_assignment/models/post_model/post_model.dart';
import 'package:api_assignment/networking/constant_network.dart';
import 'package:http/http.dart' as http;

mixin PostMethod on ConstantNetworking {
  Future<List<PostModel>> getAllUserPosts() async {
    List<Map<String, dynamic>> decode = [];
    final uri = Uri.parse("$baseUrl$postsEndPoint");
    final response = await http.get(uri);
    decode = List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();

    List<PostModel> posts =
        decode.map((element) => PostModel.fromJson(element)).toList();

    return posts.where((post) => post.userId == 1).toList();
  }
}
