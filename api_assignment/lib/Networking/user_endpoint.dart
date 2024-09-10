import 'dart:convert';
import 'package:api_assignment/Networking/const_network.dart';
import 'package:http/http.dart' as http;

mixin UserEndpoint on ConstNwtworking {
  getUsers() async {
    final response = await http.get(Uri.parse(url + userEndpoint)); // convert response.body  into a list of maps
    List<Map<String,dynamic>> responseBody = List.castFrom(jsonDecode(response.body)).cast<Map<String,dynamic>>();
    return responseBody;
  }
}