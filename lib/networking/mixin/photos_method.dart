import 'dart:convert';

import 'package:api_assignment/models/photos_model/photo_model.dart';
import 'package:api_assignment/networking/constant_networking.dart';
import 'package:http/http.dart' as http;

mixin PhotosMethod on ConstantNetworking{
 Future<List<PhotoModel> > getPhotos() async {
    final response = await http.get(Uri.parse(url + photosEndpoint));
    List<Map<String, dynamic>> photosData = List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();
    List<PhotoModel> photos = [];
    for (int i=0; i< 10; i++) {
      photos.add(PhotoModel.fromJson(photosData[i]));
    }
    return photos;
  }


}