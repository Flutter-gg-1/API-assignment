import 'package:api/model/album_model.dart';
import 'package:api/network/const_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

mixin AlbumApi on ConstApi {
  Future<List<AlbumModel>> getAlbum() async {
    final response = await http.get(Uri.parse("$url$albumUrl"));
    List<Map<String, dynamic>> resposeData =
        List.from(jsonDecode(response.body));
    List<AlbumModel> albums = [];
    for (int i = 0; i < 10; i++) {
      albums.add(AlbumModel.fromJson(resposeData[i]));
    }
    return albums;
  }
}
