import 'package:api_assignment/networking/constant_networking.dart';
import 'package:api_assignment/networking/mixin/photos_method.dart';
import 'package:api_assignment/networking/mixin/posts_method.dart';
import 'package:api_assignment/networking/mixin/users_method.dart';

class NetworkingApi extends ConstantNetworking
    with UsersMethod, PhotosMethod, PostsMethod {}
