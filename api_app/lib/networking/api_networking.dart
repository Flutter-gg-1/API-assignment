import 'package:api_app/networking/constant_networking.dart';
import 'package:api_app/networking/mixin/photo_method.dart';
import 'package:api_app/networking/mixin/post_method.dart';
import 'package:api_app/networking/mixin/user_method.dart';

class ApiNetworking extends ConstantNetworking
    with UserMethod, PhotoMethod, PostMethod {}
