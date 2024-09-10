import 'dart:convert';

import 'package:class_11/models/users_model.dart';
import 'package:class_11/networking/mixin/constant_netowkring.dart';
import 'package:http/http.dart' as http;

mixin UsersMethodApi on ConstantNetowkring {
  Future<List<UsersModel>> getAllUsers() async {
    final response = await http.get(Uri.parse(url + usersEndpoint));
    List<Map<String, dynamic>> dataUsers =
        List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();
    List<UsersModel> users = [];
    for (var element in dataUsers) {
      users.add(UsersModel.fromJson(element));
    }
    return users;
  }

   getUserById({required String id}) async {
    final response = await http.get(Uri.parse("$url$usersEndpoint/$id"));
    UsersModel user = UsersModel.fromJson(Map.from(jsonDecode(response.body)).cast<String,dynamic>());
    return user;

  }
}
