import 'dart:convert';

import 'package:api_assignment/model/photo_model.dart';
import 'package:api_assignment/networking/api_constant.dart';
import 'package:http/http.dart' as http;

mixin PhotosApi on ApiConstant {
  List<PhotosModel> allPhotos = [];
  Future<List<PhotosModel>> displayAllPhotos() async {
    // 1- Convert URL to URI
    final uri = Uri.parse('$baseUrl$photosEndpoint');
    // 2- Send Request(GET, POST, PUT, DELETE)
    final response = await http.get(uri);
    // 3- Decode Response String to JSON(Map)
    final responseDecoded = jsonDecode(response.body);
    // 4- Convert JSON(Map) to Model(Object)
    for (var element in responseDecoded) {
      allPhotos.add(PhotosModel.fromJson(element));
    }
    return allPhotos;
  }

  // display posts only if userId == 1.
  Future<List<PhotosModel>> displayPhotosByUserId(int userId) async {
    // 1- Convert URL to URI
    final uri = Uri.parse('$baseUrl$photosEndpoint?id=$userId');
    // 2- Send Request(GET, POST, PUT, DELETE)
    final response = await http.get(uri);
    // 3- Decode Response String to JSON(Map)
    final responseDecoded = jsonDecode(response.body);
    // 4- Convert JSON(Map) to Model(Object)
    for (var element in responseDecoded) {
      allPhotos.add(PhotosModel.fromJson(element));
    }
    return allPhotos;
  }
}
