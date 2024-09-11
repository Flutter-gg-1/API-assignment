import 'dart:convert';
import 'package:api_assignment/Networking/const_network.dart';
import 'package:api_assignment/model/posts_model.dart';
import 'package:http/http.dart' as http;

mixin PostsEndpoint on ConstNetworking {

  final List<PostsModel> postsResponseBody = [];
  Future<List<PostsModel>> getPosts() async {
    final response = await http
        .get(Uri.parse(url + postsEndpoint)); // convert response.body  into  map

            for (var element in jsonDecode(response.body)) {
      postsResponseBody.add(PostsModel.fromJson(element));
    }
    return postsResponseBody;
  }
}
