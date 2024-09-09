import 'dart:convert';
import 'dart:math';

import 'package:api_assignment/models/album_model.dart';
import 'package:api_assignment/models/photo_model.dart';
import 'package:api_assignment/services/api_constants.dart';
import 'package:http/http.dart' as http;

mixin PhotosEndPointMethod on ApiConstants {
  Future<List<PhotoModel>> getUserPhotos({required int userId}) async {
    // step 1 : get user albums and choose one randomly
    final albumResponse = await http.get(Uri.parse(baseUrl + albumsEndPoint));
    List<dynamic> albumsAsDynamicList = jsonDecode(albumResponse.body);
    List<Map<String,dynamic>> albumsAsMapList = List.from(albumsAsDynamicList).cast<Map<String,dynamic>>();
    List<AlbumModel> albums = [];
    for (var albumAsMap in albumsAsMapList) {
      albums.add(AlbumModel.fromJson(albumAsMap));
    }
    List<AlbumModel> userAlbums = albums.where((album)=>album.userId==userId).toList();
    AlbumModel randomAlbum = userAlbums[Random().nextInt(userAlbums.length)];
    
    // step 2 : get the first ten photos of that random album
    final photoResponse = await http.get(Uri.parse(baseUrl + photosEndPoint));
    List<dynamic> photosAsDynamicList = jsonDecode(photoResponse.body);
    List<Map<String,dynamic>> photosAsMapList = List.from(photosAsDynamicList).cast<Map<String,dynamic>>();
    List<PhotoModel> photos = [];
    for (var photoAsMapList in photosAsMapList) {
      if(photoAsMapList['albumId']==randomAlbum.id) {
        if(photos.length==10) {
          break;
        }
        photos.add(PhotoModel.fromJson(photoAsMapList));
      }
    }
    return photos;
  }
}