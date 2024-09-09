import 'package:api_test/networking/network_mgr.dart';
import 'package:http/http.dart' as http;

import '../../model/photo.dart';
import '../utils/from_json.dart';

mixin PhotosMethodApi on NetworkMgr {
  List<Photo> photos = [];
  var start = 0;
  var limit = 10;

  void next() => start += 10;
  void previous() => start == 0 ? start : start -= 10;

  Future<void> fetchPhotos() async {
    final response = await http.get(Uri.parse(
        endPointPath(endPoint: EndPoint.photos, start: start, limit: limit)));
    var jsonString = response.body;

    photos = await FromJson.decodeItems(
        responseBody: jsonString, fromJson: (json) => Photo.fromJson(json));
  }
}
