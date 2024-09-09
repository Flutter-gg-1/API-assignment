import 'package:api_assignment/models/user/address_model.dart';
import 'package:api_assignment/models/user/company_model.dart';

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
  late final AddressModel address;
  late final String phone;
  late final String website;
  late final CompanyModel company;
  
  UserModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    address = AddressModel.fromJson(json['address']);
    phone = json['phone'];
    website = json['website'];
    company = CompanyModel.fromJson(json['company']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['address'] = address.toJson();
    data['phone'] = phone;
    data['website'] = website;
    data['company'] = company.toJson();
    return data;
  }
}

