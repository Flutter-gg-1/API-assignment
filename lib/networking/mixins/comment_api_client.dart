import 'dart:convert';

import 'package:api_assignment/models/comment.dart';
import 'package:api_assignment/networking/api_constants.dart';
import 'package:http/http.dart' as http;


mixin CommentApiClient on ApiConstants{

  Future<List<Comment>> getAllComments({required int postId}) async {
    final String postsCommentEndpoint = '?postId=$postId';
    final response = await http.get(Uri.parse('$baseurl$commentsEndpoint$postsCommentEndpoint'));

    List commentsData =
        List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();

    List<Comment> comments = [];

    for (var comment in commentsData) {
      comments.add(Comment.fromJson(comment));
    }
    return comments;
  }
}