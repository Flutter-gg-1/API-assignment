import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:api_flutter/model/users_model.dart';
import 'package:api_flutter/networking/constant_networking.dart';

mixin UserMethod on Constans {
  Future<List<Users>> allUsers() async {
    final response = await http.get(Uri.parse(url + userEndpoint));
    List<Map<String, dynamic>> bodym =
        List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();
        //to print all data response.body
        //to print status code response.statusCode
    List<Users> user = [];
    for (var element in bodym) {
      user.add(Users.fromJson(element));
    }
    return user;
  }
}
//josn format