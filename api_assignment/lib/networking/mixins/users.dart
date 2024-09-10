import 'dart:convert';
import 'package:api_assignment/model/user_model.dart';
import 'package:api_assignment/networking/api_constant.dart';
import 'package:http/http.dart' as http;

mixin UsersApi on ApiConstant {
  List<UserModel> allUsers = [];
  Future<List<UserModel>> displayAllUsers() async {
    // 1- Convert URL to URI
    final uri = Uri.parse('$baseUrl$usersEndpoint');
    // 2- Send Request(GET, POST, PUT, DELETE)
    final response = await http.get(uri);
    // 3- Decode Response String to JSON(Map)
    final responseDecoded = jsonDecode(response.body);
    // 4- Convert JSON(Map) to Model(Object)
    for (var element in responseDecoded) {
      allUsers.add(UserModel.fromJson(element));
    }
    return allUsers;
  }
}
