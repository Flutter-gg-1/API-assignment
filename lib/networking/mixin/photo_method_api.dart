import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:api_project/model/photo_model.dart';
import 'package:api_project/networking/constant_networking.dart';

mixin PhotoMethodApi on ConstantNetworking{

  Future<List<PhotoModel>> getOnlyCustomQuantityOfPhoto({required int quantity})async{
   final response = await http.get(Uri.parse('$baseUrl$photosEndPoint'));
   List<Map<String,dynamic>> photoList = 
   List.from(jsonDecode(response.body)).cast<Map<String,dynamic>>();

   List<PhotoModel> customPhotList = [];
   if (photoList.length>=quantity) {
     for (var i = 0; i < quantity; i++) {
     customPhotList.add(PhotoModel.fromJson(photoList[i]));
   }
   } else {
     for (var element in photoList) {
       customPhotList.add(PhotoModel.fromJson(element));
     }
   }
   return customPhotList;
  }
}