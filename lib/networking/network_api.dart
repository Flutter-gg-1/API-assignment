import 'package:api_lab/networking/constent_networking.dart';
import 'package:api_lab/networking/mixin/photo_method.dart';
import 'package:api_lab/networking/mixin/posts_method.dart';
import 'package:api_lab/networking/mixin/user_method.dart';

class NetworkApi extends ConstentNetworking
    with UserMethod, PostsMethod, PhotoMethod {}
