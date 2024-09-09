import 'dart:convert';

import 'package:api_assignment/models/album.dart';
import 'package:api_assignment/networking/api_constants.dart';
import 'package:http/http.dart' as http;


mixin AlbumApiClient on ApiConstants{

  Future<List<Album>> getAllAlbums() async {
    final response = await http.get(Uri.parse('$baseurl$albumsEndpoint'));

    List albumsData =
        List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();

    List<Album> albums = [];

    for (var album in albumsData) {
      albums.add(Album.fromJson(album));
    }
    return albums;
  }
}