import 'dart:convert';

import 'package:api_assignment/models/user_model.dart';
import 'package:api_assignment/services/api_constants.dart';
import 'package:http/http.dart' as http;

mixin UsersEndPointMethods on ApiConstants {
  Future<List<UserModel>> getAllUsers() async {
    // step 1 : send request & store response.
    final response = await http.get(Uri.parse(baseUrl + usersEndPoint));

    // step 2 : decode response body from string to the original data type.
    List<dynamic> usersAsDynamicList = jsonDecode(response.body);

    // step 3 : cast the decoded result to the desired data type.
    List<Map<String,dynamic>> usersAsMapList = List.from(usersAsDynamicList).cast<Map<String,dynamic>>();

    // step 4 : convert map to the desired class object
    List<UserModel> users = [];
    for (var userAsMap in usersAsMapList) {
      users.add(UserModel.fromJson(userAsMap));
    }

    return users;
  }
}