import 'package:api_lab/networking/constent_networking.dart';
import 'package:api_lab/networking/endPoints/posts_method.dart';
import 'package:api_lab/networking/endPoints/user_method.dart';

class NetworkApi extends ConstentNetworking with UserMethod, PostsMethod {}
