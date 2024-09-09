import 'dart:convert';
import 'package:api_assignment/models/post_model.dart';
import 'package:api_assignment/services/api_constants.dart';
import 'package:http/http.dart' as http;

mixin PostsEndPointMethods on ApiConstants {
  Future<List<PostModel>> getUserPosts({required int userId}) async {
    // step 1 : send request & store response.
    final response = await http.get(Uri.parse(baseUrl + postsEndPoint));
    
    // step 2 : decode response body from string to the original data type.
    List<dynamic> postsAsDynamicList = jsonDecode(response.body);

    // step 3 : cast the decoded result to the desired data type.
    List<Map<String,dynamic>> postsAsMapList = List.from(postsAsDynamicList).cast<Map<String,dynamic>>();

    // step 4 : convert map to the desired class object
    List<PostModel> userPosts = [];
    for (var postAsMap in postsAsMapList) {
      if(postAsMap['userId']==userId) {
        userPosts.add(PostModel.fromJson(postAsMap));
      }
    }
    return userPosts;
  }
}