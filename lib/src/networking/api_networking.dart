import 'package:train8/src/networking/constant_networking.dart';
import 'package:train8/src/networking/mixin/photos_methods.dart';
import 'package:train8/src/networking/mixin/users_method.dart';

class ApiNetworking extends ConstantNetworking
    with UsersMethodApi, photosMethodApi {}
