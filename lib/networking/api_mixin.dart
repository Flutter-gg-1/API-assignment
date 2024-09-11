import 'package:api_assignment/networking/api_constant.dart';
import 'package:api_assignment/networking/mixins/posts.dart';

import 'mixins/albums.dart';
import 'mixins/comments.dart';
import 'mixins/photos.dart';
import 'mixins/todos.dart';
import 'mixins/users.dart';

class ApiMixin extends ApiConstant
    with PostsApi, TodosApi, AlbumsApi, UsersApi, PhotosApi, CommentsApi {}
