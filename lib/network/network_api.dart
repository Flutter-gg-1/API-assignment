import 'package:api/network/album_api.dart';
import 'package:api/network/const_api.dart';
import 'package:api/network/post_api.dart';
import 'package:api/network/user_api.dart';

class NetworkApi extends ConstApi with UserApi, PostApi, AlbumApi{}