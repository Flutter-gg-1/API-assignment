import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:train8/src/models/users/user_model.dart';
import 'package:train8/src/networking/constant_networking.dart';

mixin UsersMethodApi on ConstantNetworking {

  // getAllUser 
  Future<List<User>> getAllUsers() async {
    final response = await http.get(Uri.parse(baseUrl + userEndPoint));
    if (response.statusCode == 200) {
      final List<User> users = [];

      // loop through the JSON array and create UserModel objects from each element
      for (var user in jsonDecode(response.body)) {
        users.add(User.fromJson(user));
      }
      return users;
    } else {
      throw Exception('Failed to get users');
    }
  }
}
