import 'package:api_assignment/networking/api_constant.dart';
import 'package:http/http.dart' as http;

mixin UsersApi on ApiConstant {
  displayAllUsers() async {
    final respond = await http.get(Uri.parse(baseUrl + usersEndpoint));

    return respond;
  }
}
