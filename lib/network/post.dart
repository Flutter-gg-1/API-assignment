import 'dart:convert';

import 'package:apiasswignment/Models/Post.dart';
import 'package:apiasswignment/network/constant.dart';
import 'package:http/http.dart' as http;

mixin PostMethod on Constant {
  Future<List<Post>> getallPosts() async {
    List<Post> post = [];
    final url = Uri.parse(baseUrl + endPointPost);

    final respons = await http.get(url);
    if (respons.statusCode == 200) {
     
      final List<dynamic> decoded = jsonDecode(respons.body);
      for (var element in decoded) {
         post.add(Post.fromJson(element as Map<String, dynamic>));
      }
    } else {
      throw Exception('Failed to load Posts');
    }
    return post;
  }
}
