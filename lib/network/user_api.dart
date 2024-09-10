import 'dart:convert';

import 'package:api/model/user_model.dart';
import 'package:api/network/const_api.dart';
import 'package:http/http.dart' as http;

mixin UserApi on ConstApi {
  Future<List<UserModel>> getAllUser() async {
    final response = await http.get(Uri.parse("$url$user"));
    List<Map<String, dynamic>> responseData =
        List.from(jsonDecode(response.body));
    List<UserModel> users = [];
    for (var element in responseData) {
      users.add(UserModel.fromJson(element));
    }
    return users;
  }
}
