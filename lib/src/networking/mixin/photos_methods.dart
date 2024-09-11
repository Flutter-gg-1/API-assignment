import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:train8/src/models/photos/photos_model.dart';
import 'package:train8/src/networking/constant_networking.dart';

mixin photosMethodApi on ConstantNetworking {
  Future<List<Photos>> getAllPhotos() async {
    List<Photos> photosList = [];

    final response = await http.get(Uri.parse(baseUrl + photosEndPoint));
// convert from string to map
    final decodeResponce = jsonDecode(response.body);
    //convert  from map to list of object

    List<Map<String, dynamic>> photosData =
        List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();

    for (int i = 0; i < 10; i++) {
      photosList.add(Photos.fromJson(photosData[i]));
    }
    return photosList;
  }
}
