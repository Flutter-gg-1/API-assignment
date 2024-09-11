import 'dart:convert';

import 'package:apiasswignment/Models/Pics.dart';
import 'package:apiasswignment/network/constant.dart';
import 'package:http/http.dart' as http;

mixin PicsMithod on Constant {
  Future<List<Pics>> getallPicss() async {
    List<Pics> pics = [];
    final url = Uri.parse(baseUrl + endPointPic);

    final respons = await http.get(url);
    if (respons.statusCode == 200) {
     
      final List<dynamic> decoded = jsonDecode(respons.body);
      for (var element in decoded) {
         pics.add(Pics.fromJson(element as Map<String, dynamic>));
      }
    } else {
      throw Exception('Failed to load Picss');
    }
    return pics;
  }
}
