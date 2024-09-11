import 'dart:convert';
import 'package:api_assignment/Networking/const_network.dart';
import 'package:api_assignment/model/users_model.dart';
import 'package:http/http.dart' as http;

mixin UserEndpoint on ConstNetworking {

  final List<UserModel> responseBody = [];
  Future<List<UserModel>> getUsers() async {
    final response = await http
        .get(Uri.parse(url + userEndpoint)); // convert response.body  into  map

            for (var element in jsonDecode(response.body)) {
      responseBody.add(UserModel.fromJson(element));
    }
    return responseBody;
  }
}
