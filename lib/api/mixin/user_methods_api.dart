import 'dart:convert';
import 'package:api_assignment/api/constants.dart';
import 'package:api_assignment/models/user/user_model.dart';
import 'package:http/http.dart' as http;

mixin UserMethodsApi on Constants {
  Future<List<UserModel>> getAllUsers() async {
    final response = await http.get(Uri.parse(baseUrl + usersEndpoint));
    List<Map<String, dynamic>> dataAsList =
        List<Map<String, dynamic>>.from(jsonDecode(response.body));
    List<UserModel> users = dataAsList.map((user) {
      return UserModel.fromJson(user);
    }).toList();
    return users;
  }
}
