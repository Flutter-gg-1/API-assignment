import 'dart:convert';

import 'package:api_lab/models/photo_model.dart';
import 'package:api_lab/networking/constent_networking.dart';
import 'package:http/http.dart' as http;

mixin PhotoMethod on ConstentNetworking {
 Future<List<PhotoModel>> getPhoto() async {
    final response = await http.get(Uri.parse("$url$photosEndoint"));
    final List<Map<String, dynamic>> responseAsList =
        List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();
    List<PhotoModel> photoList = [];
    for (var element in responseAsList) {
      photoList.add(PhotoModel.fromJson(element));
    }
    return photoList;
  }
}
