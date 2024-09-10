import 'package:api_assignment/networking/const_networking.dart';
import 'package:api_assignment/networking/mixing/comments_endpoint.dart';
import 'package:api_assignment/networking/mixing/photo_endpoint.dart';
import 'package:api_assignment/networking/mixing/post_endpoint.dart';
import 'package:api_assignment/networking/mixing/todos_endpoint.dart';
import 'package:api_assignment/networking/mixing/user_endpoint.dart';

class NetworkApi extends ConstNetwork
    with
        CommentsEndpoint,
        PhotoEndpointApi,
        PostEndpointApi,
        TodosEndpoint,
        UserEndpoint {}
