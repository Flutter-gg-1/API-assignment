import 'dart:convert';

import 'package:api_app/model/photo_model.dart';
import 'package:api_app/networking/constant_networking.dart';
import 'package:http/http.dart' as http;

mixin PhotoMethod on ConstantNetworking {
  Future<List<PhotoModel>> getTenPhotos() async {
    final response = await http.get(Uri.parse("$baseUrl$PhotoEndPoint"));
    final dataJson = jsonDecode(response.body);
    List<PhotoModel> listPhoto = [];
    for (var element in dataJson) {
      listPhoto.add(PhotoModel.fromJson(element));
    }
    return listPhoto;
  }
}
