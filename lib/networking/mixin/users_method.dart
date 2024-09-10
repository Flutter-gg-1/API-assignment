import 'dart:convert';

import 'package:api_assignment/models/users_model/user_model.dart';
import 'package:api_assignment/networking/constant_networking.dart';
import 'package:http/http.dart' as http;

mixin UsersMethod on ConstantNetworking{
 Future<List<UserModel>>  getAllUsers() async{
    final response = await http.get(Uri.parse(url + usersEndpoint));
    List<Map<String, dynamic>> userData = List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();
    List<UserModel> users = [];
    for (var element in userData) {
      users.add(UserModel.fromJson(element));
    }
    return users;
  }
}