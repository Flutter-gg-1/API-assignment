import 'package:api_test/networking/network_mgr.dart';
import 'package:http/http.dart' as http;

import '../../model/post.dart';
import '../utils/from_json.dart';

mixin PostMethodApi on NetworkMgr {
  List<Post> posts = [];

  Future<void> fetchPosts() async {
    final response =
        await http.get(Uri.parse(endPointPath(endPoint: EndPoint.posts)));
    var jsonString = response.body;

    posts = await FromJson.decodeItems(
        responseBody: jsonString, fromJson: (json) => Post.fromJson(json));
  }
}
