import 'dart:convert';

import 'package:api_lab/models/user_model.dart';
import 'package:api_lab/networking/constent_networking.dart';
import 'package:http/http.dart' as http;

mixin UserMethod on ConstentNetworking {
  Future<List<UserModel>> getAllUsers() async {
    final response = await http.get(Uri.parse("$url$userEndoint"));
    List<Map<String, dynamic>> responseAsList =
        List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();
    List<UserModel> allUsers = [];
    for (var element in responseAsList) {
      allUsers.add(UserModel.fromJson(element));
    }
    return allUsers;
  }
}
