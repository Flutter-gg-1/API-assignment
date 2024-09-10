import 'dart:convert';

import 'package:api_assignment/models/photo_model/photo_model.dart';
import 'package:api_assignment/networking/constant_network.dart';
import 'package:http/http.dart' as http;


mixin PhotoMethod on ConstantNetworking{
Future<List<PhotoModel>> getAllPhotos() async {
    List<Map<String, dynamic>> decode = [];
    final uri = Uri.parse("$baseUrl$photosEndPoint");
    final response = await http.get(uri);
    decode = List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();
    List<PhotoModel> photos = [];
    for (var element in decode) {
      photos.add(PhotoModel.fromJson(element));
    }
    return photos;
  }

}