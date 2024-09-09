import 'dart:convert';

import 'package:api_assignment/models/user%20model/user.dart';
import 'package:api_assignment/networking/api_constants.dart';
import 'package:http/http.dart' as http;

mixin UserApiClient on ApiConstants {
  
  Future<List<User>> getAllUsers() async {
    final response = await http.get(Uri.parse('$baseurl$usersEndpoint'));

    List usersData =
        List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();

    List<User> users = [];

    for (var user in usersData) {
      users.add(User.fromJson(user));
    }
    return users;
  }
}
