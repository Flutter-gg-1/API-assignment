import 'dart:convert';

import 'package:api_assignment/models/user_model.dart';
import 'package:api_assignment/networking/const_networking.dart';
import 'package:http/http.dart' as http;

mixin UserEndpoint on ConstNetwork {
  Future<List<UserModel>> getCharacter() async {
    List<UserModel> charList = [];
//1-
    final uri = Uri.parse("$url$userEndpoint");

//2-
    final response = await http.get(uri);

//3-
    final decode = jsonDecode(response.body);

    List<Map<String, dynamic>> newList = List.from(decode).cast <Map<String,dynamic>>();
    for (var element in newList) {
      charList.add(UserModel.fromJson(element));
    }
    return charList;
  }

  

  Future<List<UserModel>> getAllUsers() async {
    final response = await http.get(Uri.parse(url + userEndpoint));
    List<Map<String, dynamic>> dataUsers =
        List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();

    List<UserModel> users = [];
    for (var element in dataUsers) {
      users.add(UserModel.fromJson(element));
    }

    return users;
  }

  //---------

  Future<UserModel> getUser({required int id}) async {
    final response = await http.get(Uri.parse('$url$userEndpoint/$id'));
    return UserModel.fromJson(
        Map.from(jsonDecode(response.body)).cast<String, dynamic>());
  }
}
