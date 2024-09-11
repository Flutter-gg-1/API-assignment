import 'dart:convert';

import 'package:api_flutter/model/album_model.dart';
import 'package:api_flutter/networking/constant_networking.dart';
import 'package:http/http.dart' as http;

mixin PhotoMethod on Constans {
  Future<List<PhotoModel>> photos() async {
    final response = await http.get(Uri.parse(url + photosEndpoint));
    List<Map<String, dynamic>> bodym =
        List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();
    //to print all data response.body
    //to print status code response.statusCode
    List<PhotoModel> photo = [];
    for (var element in bodym) {
      photo.add(PhotoModel.fromJson(element));
    }
    return photo;
  }
}
