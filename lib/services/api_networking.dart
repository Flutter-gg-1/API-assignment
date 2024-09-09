import 'package:api_assignment/services/api_constants.dart';
import 'package:api_assignment/services/end_points_methods/posts_end_point_methods.dart';
import 'package:api_assignment/services/end_points_methods/users_end_point_methods.dart';

class ApiNetworking extends ApiConstants with UsersEndPointMethods, PostsEndPointMethods {}