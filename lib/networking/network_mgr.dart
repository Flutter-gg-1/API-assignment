import 'package:flutter/material.dart';

class NetworkMgr {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/';

  String endPoint(EndPoint endPoint) => '/${endPoint.name}';
}

enum EndPoint { users, todos, photos, albums, documents, posts }
