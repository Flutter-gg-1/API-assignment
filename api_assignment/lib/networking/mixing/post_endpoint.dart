// import 'dart:convert';

// import 'package:api_assignment/models/post_model.dart';
// import 'package:api_assignment/networking/const_networking.dart';
// import 'package:http/http.dart' as http;

// mixin PostEndpointApi on ConstNetwork {
//   Future<List<PostModel>> getPhoto() async {
//     List<PostModel> photoList = [];

//     //1- Build the URI from base URL and endpoint
//     final uri = Uri.parse("$url$photoEndpoint");

//     try {
//       //2- Send HTTP GET request
//       final response = await http.get(uri);

//       //3- Check if the request was successful
//       if (response.statusCode == 200) {
//         // Decode the JSON response body into a list
//         final List<dynamic> decodedBody = jsonDecode(response.body);

//         // Convert each element of the list into PhotoModel
//         photoList =
//             decodedBody.map((json) => PostModel.fromJson(json)).toList();
//       } else {
//         throw Exception('Failed to load phost');
//       }
//     } catch (error) {
//       print(error);
//     }

//     return photoList;
//   }
// }



import 'dart:convert';
import 'package:api_assignment/models/post_model.dart';
import 'package:api_assignment/networking/const_networking.dart';
import 'package:http/http.dart' as http;

mixin PostEndpointApi on ConstNetwork {
  Future<List<PostModel>> getPosts() async {
    List<PostModel> postList = [];

    //1- Build the URI from base URL and endpoint for posts
    final uri = Uri.parse("$url$postEndpoint"); // Ensure postEndpoint is defined in ConstNetwork

    try {
      //2- Send HTTP GET request
      final response = await http.get(uri);

      //3- Check if the request was successful
      if (response.statusCode == 200) {
        // Decode the JSON response body into a list
        final List<dynamic> decodedBody = jsonDecode(response.body);

        // Convert each element of the list into PostModel
        postList = decodedBody.map((json) => PostModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (error) {
      print("Error fetching posts: $error");
    }

    return postList;
  }
}
