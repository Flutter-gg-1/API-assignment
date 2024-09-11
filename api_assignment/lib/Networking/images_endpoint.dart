import 'dart:convert';
import 'package:api_assignment/Networking/const_network.dart';
import 'package:api_assignment/model/images_model.dart';
import 'package:http/http.dart' as http;

mixin ImagesEndpoint on ConstNetworking {

  final List<PhotosModel> imageResponseBody = [];
  Future<List<PhotosModel>> getPhotos() async {
    final response = await http
        .get(Uri.parse(url + imagwesEndpoint)); // convert response.body  into  map

            for (var element in jsonDecode(response.body)) {
      imageResponseBody.add(PhotosModel.fromJson(element));
    }
    return imageResponseBody;
  }
}
