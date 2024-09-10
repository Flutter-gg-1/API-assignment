import 'dart:convert';
import 'package:api_project/model/user_model.dart';
import 'package:api_project/networking/constant_networking.dart';
import 'package:http/http.dart' as http;

mixin UserMethodApi on ConstantNetworking {

  Future<List<UserModel>> getAllUser() async {
    final response = await http.get(Uri.parse(baseUrl + usersEndPoint));
    List<Map<String,dynamic>> userList = 
    List.from(jsonDecode(response.body)).cast<Map<String,dynamic>>();

    List<UserModel> user = [];
    for (var element in userList) {
      user.add(UserModel.fromJson(element));
    } 
    return user;
  }
}
