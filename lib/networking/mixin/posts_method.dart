import 'dart:convert';

import 'package:api_assignment/models/posts_model/post_model.dart';
import 'package:api_assignment/networking/constant_networking.dart';
import 'package:http/http.dart' as http;


mixin PostsMethod on ConstantNetworking{
  Future<List<PostModel>>  getAllposts() async{
    final response = await http.get(Uri.parse('$url$postsEndpoint?userId=1'));
    List<Map<String, dynamic>> postData = List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();
    List<PostModel> posts = [];
    for (var element in postData) {
      posts.add(PostModel.fromJson(element));
    }
    return posts;
  }
}