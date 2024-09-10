import 'package:api_test/networking/network_mgr.dart';
import 'package:http/http.dart' as http;

import '../../model/photo.dart';
import '../utils/from_json.dart';

mixin PhotosMethodApi on NetworkMgr {
  Future<List<Photo>> fetchPhotos({String? params}) async {
    final response = await http.get(
        Uri.parse(endPointPath(endPoint: EndPoint.photos, params: params)));
    var jsonString = response.body;

    var photos = await FromJson.decodeItems(
        responseBody: jsonString, fromJson: (json) => Photo.fromJson(json));

    return photos;
  }
}
