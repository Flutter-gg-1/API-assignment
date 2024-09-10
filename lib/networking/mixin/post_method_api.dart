import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:api_project/model/post_model.dart';
import 'package:api_project/networking/constant_networking.dart';

mixin PostMethodApi on ConstantNetworking{
  Future<PostModel> getPost({required int id})async{
    final response = await http.get(Uri.parse('$baseUrl$postsEndPoint'));
    final List<Map<String,dynamic>> postList = 
    List.from(jsonDecode(response.body)).cast<Map<String,dynamic>>();
    PostModel post = PostModel();
    for (var element in postList) {
      if (element["id"]) {
        post = PostModel.fromJson(element);
      }
    }
    return post;
  }
   
}