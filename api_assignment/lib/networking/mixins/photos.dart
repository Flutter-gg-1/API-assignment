import 'dart:convert';

import 'package:api_assignment/networking/api_constant.dart';
import 'package:http/http.dart' as http;

mixin PhotosApi on ApiConstant {
  display10OnlyOfPhotos() async {
    final respond = await http.get(Uri.parse(baseUrl + photosEndpoint));
    List<Map<String, dynamic>> respondData =
        List.from(jsonDecode(respond.body)).cast<Map<String, dynamic>>();
    respondData = respondData.sublist(0, 10);
    List<Map<String, dynamic>> dataList = [];
    for (var element in respondData) {
      dataList.add(element);
      print(dataList[0]['url']);
    }
  }
}
