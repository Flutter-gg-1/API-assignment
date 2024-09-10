import 'dart:convert';

import 'package:api_assignment/models/users_model/user_model.dart';
import 'package:api_assignment/networking/constant_network.dart';
import 'package:http/http.dart' as http;

mixin UserMethod on ConstantNetworking {
  Future<List<UserModel>> getAllUsers() async {
    List<Map<String, dynamic>> decode = [];
    final uri = Uri.parse("$baseUrl$usersEndPoint");
    final response = await http.get(uri);
    decode = List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();
    List<UserModel> users = [];
    for (var element in decode) {
      users.add(UserModel.fromJson(element));
    }
    return users;
  }
}
