import 'package:api_app/model/address_model.dart';
import 'package:api_app/model/company_model.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });
  late final int id;
  late final String name;
  late final String username;
  late final String email;
  late final Address address;
  late final String phone;
  late final String website;
  late final Company company;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    address = Address.fromJson(json['address']);
    phone = json['phone'];
    website = json['website'];
    company = Company.fromJson(json['company']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['username'] = username;
    _data['email'] = email;
    _data['address'] = address.toJson();
    _data['phone'] = phone;
    _data['website'] = website;
    _data['company'] = company.toJson();
    return _data;
  }
}
