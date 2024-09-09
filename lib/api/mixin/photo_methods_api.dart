import 'dart:convert';

import 'package:api_assignment/api/constants.dart';
import 'package:api_assignment/models/photo/photo_model.dart';
import 'package:http/http.dart' as http;

mixin PhotoMethodsApi on Constants {
  Future<List<PhotoModel>> getAllPhotos() async {
    final response = await http.get(Uri.parse(baseUrl + photosEndpoint));
    List<Map<String, dynamic>> listOfMap =
        List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();
    List<PhotoModel> photos =
        listOfMap.map((photo) => PhotoModel.fromJson(photo)).take(10).toList();
    return photos;
  }
}
