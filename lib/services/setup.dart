import 'package:api_assignment/networking/api_networking.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
setup() {
  locator.registerSingleton<ApiNetworking>(ApiNetworking());
}
