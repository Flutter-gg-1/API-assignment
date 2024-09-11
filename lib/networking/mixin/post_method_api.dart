import 'dart:convert';

import 'package:api_flutter/model/post_model.dart';
import 'package:api_flutter/networking/constant_networking.dart';
import 'package:http/http.dart' as http;

mixin PostMethod on Constans {
  List<PostModel> post = [];
  Future<List<PostModel>> getPosts() async {
    final response = await http.get(Uri.parse(url + postsEndpoint));
    List<Map<String, dynamic>> bodym =
        List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();
    //to print all data response.body
    //to print status code response.statusCode
    //List<PostModel> user = [];
    for (var element in bodym) {
      post.add(PostModel.fromJson(element));
    }
    return post;
  }

  Future<PostModel> getById({required int id}) async {
    final response = await http.get(Uri.parse('$url$postsEndpoint/$id'));
    return PostModel.fromJson(
        Map.from(jsonDecode(response.body)).cast<String, dynamic>());
  }
}
