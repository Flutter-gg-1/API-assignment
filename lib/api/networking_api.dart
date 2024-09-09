import 'package:api_assignment/api/constants.dart';
import 'package:api_assignment/api/mixin/photo_methods_api.dart';
import 'package:api_assignment/api/mixin/post_methods_api.dart';
import 'package:api_assignment/api/mixin/user_methods_api.dart';

class NetworkingApi extends Constants
    with UserMethodsApi, PostMethodsApi, PhotoMethodsApi {
      
    }
