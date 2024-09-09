import 'package:api_assignment/networking/api_constants.dart';
import 'package:api_assignment/networking/mixins/album_api_client.dart';
import 'package:api_assignment/networking/mixins/comment_api_client.dart';
import 'package:api_assignment/networking/mixins/photo_api_client.dart';
import 'package:api_assignment/networking/mixins/post_api_client.dart';
import 'package:api_assignment/networking/mixins/todo_api_client.dart';
import 'package:api_assignment/networking/mixins/user_api_client.dart';

class ApiNetworking extends ApiConstants
    with
        UserApiClient,
        PostApiClient,
        AlbumApiClient,
        CommentApiClient,
        PhotoApiClient,
        TodoApiClient {}
