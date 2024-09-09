class NetworkMgr {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/';

  String endPointPath(
      {required EndPoint endPoint, int? start = null, int? limit = null}) {
    var params = '';
    if ((start != null) || limit != null) {
      params = getParams(start, limit);
    }

    return '$baseUrl/${endPoint.name}$params';
  }

  String getParams(int? start, int? limit) {
    var result = '';
    result += (start == null) ? '' : '_start=$start&';
    result += (limit == null) ? '' : '_limit=$limit';
    result = '?$result'.trim();
    return result;
  }
}

enum EndPoint { users, todos, photos, albums, documents, posts }

enum Parameter { start, limit }
