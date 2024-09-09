import 'package:api_test/networking/network_mgr.dart';
import 'package:http/http.dart' as http;

import '../../model/user.dart';
import '../utils/from_json.dart';

mixin UserMethodApi on NetworkMgr {
  List<User> users = [];

  Future<void> fetchUsers() async {
    final response =
        await http.get(Uri.parse(endPointPath(endPoint: EndPoint.users)));
    var jsonString = response.body;

    users = await FromJson.decodeItems(
        responseBody: jsonString, fromJson: (json) => User.fromJson(json));

    users.length;
  }
}
