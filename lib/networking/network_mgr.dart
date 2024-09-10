class NetworkMgr {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/';

  String endPointPath({required EndPoint endPoint, String? params}) {
    return '$baseUrl${endPoint.name}${params ?? ''}';
  }
}

enum EndPoint { users, todos, photos, albums, documents, posts }

enum Parameter { start, limit }
