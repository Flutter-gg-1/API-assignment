import 'dart:convert';

import 'package:api_assignment/models/user_model.dart';
import 'package:api_assignment/networking/const_networking.dart';
import 'package:http/http.dart' as http;

mixin UserEndpoint on ConstNetwork {


    Future<List<UserModel>> getAllUsers() async {
    final response = await http.get(Uri.parse(url + userEndpoint));
    List<Map<String, dynamic>> dataUsers =
        List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();

    List<UserModel> users = [];
    for (var element in dataUsers) {
      users.add(UserModel.fromJson(element));
    }

    return users;
  }

  //---------

  Future<UserModel> getUser({required int id}) async {
    final response = await http.get(Uri.parse('$url$userEndpoint/$id'));
    return UserModel.fromJson(
        Map.from(jsonDecode(response.body)).cast<String, dynamic>());
  }

}
