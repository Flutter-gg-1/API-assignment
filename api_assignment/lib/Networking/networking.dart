import 'package:api_assignment/Networking/const_network.dart';
import 'package:api_assignment/Networking/posts_endpoint.dart';
import 'package:api_assignment/Networking/user_endpoint.dart';
import 'package:api_assignment/Networking/images_endpoint.dart';

class NetworkingApi extends ConstNetworking
    with ImagesEndpoint, UserEndpoint, PostsEndpoint {}
    
