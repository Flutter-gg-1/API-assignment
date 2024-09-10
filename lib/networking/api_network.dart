import 'package:class_11/networking/mixin/albums_method_api.dart';
import 'package:class_11/networking/mixin/constant_netowkring.dart';
import 'package:class_11/networking/mixin/photos_method_api.dart';
import 'package:class_11/networking/mixin/users_method_api.dart';
import 'package:class_11/networking/post_method_api.dart';

class ApiNetwork extends ConstantNetowkring with UsersMethodApi , PostMethodApi , PhotosMethodApi , AlbumsMethodApi{
  
}