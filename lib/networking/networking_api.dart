import 'package:api_project/networking/constant_networking.dart';
import 'package:api_project/networking/mixin/album_method_api.dart';
import 'package:api_project/networking/mixin/comment_method_api.dart';
import 'package:api_project/networking/mixin/photo_method_api.dart';
import 'package:api_project/networking/mixin/post_method_api.dart';
import 'package:api_project/networking/mixin/todo_method_api.dart';
import 'package:api_project/networking/mixin/user_method_api.dart';

class NetworkingApi extends ConstantNetworking
    with
        UserMethodApi,
        AlbumMethodApi,
        CommentMethodApi,
        PhotoMethodApi,
        PostMethodApi,
        TodoMethodApi {}
