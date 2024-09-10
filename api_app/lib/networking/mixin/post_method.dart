import 'dart:convert';

import 'package:api_app/model/post_model.dart';
import 'package:api_app/networking/constant_networking.dart';
import 'package:http/http.dart' as http;

mixin PostMethod on ConstantNetworking {
  Future<List<PostModel>> getOneUserPosts({required int id}) async {
    final response = await http.get(Uri.parse("$baseUrl$PostEndPoint"));
    final dataJson = jsonDecode(response.body);
    List<PostModel> listPost = [];
    for (var element in dataJson) {
      if (element["userId"] == id) {
        listPost.add(PostModel.fromJson(element));
      }
    }
    return listPost;
  }
}
