import 'dart:convert';

import 'package:api_assignment/models/photo.dart';
import 'package:api_assignment/networking/api_constants.dart';
import 'package:http/http.dart' as http;

mixin PhotoApiClient on ApiConstants {
  Future<List<Photo>> getAllPhotos({List<int>? photosIndexes}) async {

    final http.Response response;
    
    if (photosIndexes != null) {
      String photosByIdEndpoint = '?id=${photosIndexes[0]}';
      for (var i = 1; i < photosIndexes.length; i++) {
        photosByIdEndpoint += '&id=${photosIndexes[i]}';
      }
      response = await http
          .get(Uri.parse('$baseurl$photosEndpoint$photosByIdEndpoint'));
    } else {
      response = await http.get(Uri.parse('$baseurl$photosEndpoint'));
    }

    List photosData =
        List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();

    List<Photo> photos = [];

    for (var photo in photosData) {
      photos.add(Photo.fromJson(photo));
    }
    return photos;
  }
}
