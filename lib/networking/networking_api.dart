import 'package:api_lab/networking/constant_networking.dart';
import 'package:api_lab/networking/mixin/album_method_api.dart';
import 'package:api_lab/networking/mixin/comment_method_api.dart';
import 'package:api_lab/networking/mixin/photo_method_api.dart';
import 'package:api_lab/networking/mixin/post_method_api.dart';
import 'package:api_lab/networking/mixin/todo_method_api.dart';
import 'package:api_lab/networking/mixin/user_method_api.dart';

class NetworkingApi extends ConstantNetworking
    with
        UserMethodApi,
        AlbumMethodApi,
        CommentMethodApi,
        PhotoMethodApi,
        PostMethodApi,
        TodoMethodApi {}
