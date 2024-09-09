import 'package:api_test/networking/endpoints/photos_method_api.dart';
import 'package:api_test/networking/endpoints/post_method_api.dart';
import 'package:api_test/networking/network_mgr.dart';
import 'package:api_test/networking/endpoints/user_method_api.dart';

class NetworkingApi extends NetworkMgr
    with UserMethodApi, PostMethodApi, PhotosMethodApi {}
