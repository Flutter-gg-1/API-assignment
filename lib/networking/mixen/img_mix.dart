import 'dart:convert';
import 'dart:developer';

import 'package:api_asg/networking/const_url.dart';
import 'package:api_asg/networking/model/img_model.dart';
import 'package:http/http.dart' as http;

mixin ImgMix on ConstUrl {
  Future<List<ImgModel>> getImg() async {
    final List<ImgModel> imgLis = [];

    log("in api");

    final res = await http.get(Uri.parse("$domin$imgEnd"));


    List lis = jsonDecode(res.body);
    log("after decode api");

    for (var val in lis.take(10)) {
      imgLis.add(ImgModel.fromJson(val));
    }

    return imgLis;
  }
}
