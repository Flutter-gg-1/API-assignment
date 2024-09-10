import 'dart:convert';
import 'package:class_11/models/albums.dart';
import 'package:class_11/networking/mixin/constant_netowkring.dart';
import 'package:http/http.dart' as http;

mixin AlbumsMethodApi on ConstantNetowkring {
  Future<List<AlbumsModel>> getAlbumByUserId() async {
    final response = await http.get(Uri.parse(url + albumsEndpoint));

    if (response.statusCode == 200) {
      final decoder = jsonDecode(response.body);

      List<Map<String, dynamic>> allAlbums =
          List<Map<String, dynamic>>.from(decoder);

      List<Map<String, dynamic>> filteredAlbums =
          allAlbums.where((e) => e['userId'] == 1).toList();

      List<AlbumsModel> albums =
          filteredAlbums.map((e) => AlbumsModel.fromJson(e)).toList();

      return albums;
    } else {
      throw Exception('Failed to load albums');
    }
  }
}
