import 'dart:convert';

import 'package:api_app/model/user_model.dart';
import 'package:api_app/networking/constant_networking.dart';
import 'package:http/http.dart' as http;

mixin UserMethod on ConstantNetworking {
  Future<List<UserModel>> getAllUsers() async {
    List<UserModel> listUser = [];
    final response = await http.get(Uri.parse("$baseUrl$UserEndPoint"));
    final dataJson = jsonDecode(response.body);

    for (var element in dataJson) {
      listUser.add(UserModel.fromJson(element));
    }
    return listUser;
  }
}
