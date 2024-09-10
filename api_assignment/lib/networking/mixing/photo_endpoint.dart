import 'dart:convert';

import 'package:api_assignment/models/photo_model.dart';
import 'package:api_assignment/models/user_model.dart';
import 'package:api_assignment/networking/const_networking.dart';
import 'package:http/http.dart' as http;

// mixin PhotoEndpointApi on ConstNetwork {
//   Future<List<PhotoModel>> getPhoto() async {
//     List<PhotoModel> charList = [];
// //1-
//     final uri = Uri.parse("$url$photoEndpoint");

// //2-
//     final response = await http.get(uri);

// //3-
//     // final decode = jsonDecode(response.body);
//     final decode = jsonDecode(response.body);

//     List<Map<String, dynamic>> newList =
//         List.from(decode).cast<Map<String, dynamic>>();
//     for (var element in newList) {
//       charList.add(PhotoModel.fromJson(element));
//     }
//     return charList;
//   }
// }


mixin PhotoEndpointApi on ConstNetwork {
  Future<List<PhotoModel>> getPhoto() async {
    List<PhotoModel> photoList = [];

    //1- Build the URI from base URL and endpoint
    final uri = Uri.parse("$url$photoEndpoint");

    try {
      //2- Send HTTP GET request
      final response = await http.get(uri);

      //3- Check if the request was successful
      if (response.statusCode == 200) {
        // Decode the JSON response body into a list
        final List<dynamic> decodedBody = jsonDecode(response.body);

        // Convert each element of the list into PhotoModel
        photoList = decodedBody.map((json) => PhotoModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load photos');
      }
    } catch (error) {
      // Handle any errors that occur during the HTTP request
      print("Error fetching photos: $error");
    }

    return photoList;
  }
}
