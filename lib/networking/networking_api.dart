import 'package:api_assignment/networking/constant_network.dart';
import 'package:api_assignment/networking/photo_method.dart';
import 'package:api_assignment/networking/post_method.dart';
import 'package:api_assignment/networking/user_Method.dart';

class NetworkingApi extends ConstantNetworking
    with UserMethod, PhotoMethod, PostMethod {}
