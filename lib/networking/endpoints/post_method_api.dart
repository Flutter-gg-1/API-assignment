import 'package:api_test/networking/network_mgr.dart';
import 'package:http/http.dart' as http;

import '../../model/post.dart';
import '../utils/from_json.dart';

mixin PostMethodApi on NetworkMgr {
  Future<List<Post>> fetchPosts({String? params}) async {
    final response = await http
        .get(Uri.parse(endPointPath(endPoint: EndPoint.posts, params: params)));
    var jsonString = response.body;

    var posts = await FromJson.decodeItems(
        responseBody: jsonString, fromJson: (json) => Post.fromJson(json));

    return posts;
  }
}
