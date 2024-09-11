import 'dart:convert';

import 'package:apiasswignment/Models/user.dart';
import 'package:apiasswignment/network/constant.dart';
import 'package:http/http.dart' as http;

mixin UserMithod on Constant {
  Future<List<User>> getallusers() async {
    List<User> users = [];
    final url = Uri.parse(baseUrl + endPoint);

    final respons = await http.get(url);
    if (respons.statusCode == 200) {
      final List<dynamic> decoded = jsonDecode(respons.body);
      for (var element in decoded) {
        users.add(User.fromJson(element as Map<String, dynamic>));
      }
    } else {
      throw Exception('Failed to load users');
    }
    return users;
  }
}
