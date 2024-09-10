import 'dart:convert';
import 'dart:math';

import 'package:class_11/models/photos.dart';
import 'package:class_11/networking/mixin/constant_netowkring.dart';
import 'package:http/http.dart' as http;

mixin PhotosMethodApi on ConstantNetowkring {
  Future<List<Photos>> getTenPhotos() async {
    List<Photos> photos = [];
    final response = await http.get(Uri.parse(url + photosEndpoint));

    final decodedData = jsonDecode(response.body);

    for (var i = 0 ; i < 10; i++) {
      photos.add(Photos.fromJson(decodedData[Random().nextInt(400)]));
      print(photos[i].thumbnailUrl);
    }

    return photos;
  }
}
