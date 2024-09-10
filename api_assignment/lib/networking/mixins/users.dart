import 'dart:convert';
import 'package:api_assignment/model/user_model.dart';
import 'package:api_assignment/networking/api_constant.dart';
import 'package:http/http.dart' as http;

mixin UsersApi on ApiConstant {
  displayAllUsers() async {
    final respond = await http.get(Uri.parse(baseUrl + usersEndpoint));
    List<Map<String, dynamic>> respondData =
        List.from(jsonDecode(respond.body)).cast<Map<String, dynamic>>();
    List<UserModel> users = [];
    for (var element in respondData) {
      users.add(UserModel.fromJson(element));
    }
    return users;
  }
}
