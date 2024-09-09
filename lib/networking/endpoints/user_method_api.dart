import 'dart:convert';

import 'package:api_test/networking/network_mgr.dart';
import 'package:http/http.dart' as http;

import '../../model/user.dart';

mixin UserMethodApi on NetworkMgr {
  List<User> users = [];

  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse(baseUrl + EndPoint.users.name));
    var jsonString = response.body;

    users = await JsonConverter.readItems(
        responseBody: jsonString, fromJson: (json) => User.fromJson(json));
  }
}

class JsonConverter {
  static Future<List<T>> readItems<T>({
    required String responseBody,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    if (responseBody.isEmpty) {
      return [];
    } else {
      var jsonResult = json.decode(responseBody);
      List<T> objects = (jsonResult != null)
          ? List<T>.from(jsonResult.map((jsonItem) => fromJson(jsonItem)))
          : [];
      return objects;
    }
  }
}
