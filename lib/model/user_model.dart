
import 'package:api_project/model/address_model.dart';
import 'package:api_project/model/company_model.dart';

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

  factory UserModel.fromJson(Map json) {
    final address = json['address'];
    final company = json['company'];
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: AddressModel.fromJson(
        address as Map<String, dynamic>,
      ),
      phone: json['phone'],
      website: json['website'],
      company: CompanyModel.fromJson(
        company as Map<String, dynamic>,
      ),
    );
  }

  final int id;
  final String name;
  final String username;
  final String email;
  final AddressModel address;
  final String phone;
  final String website;
  final CompanyModel company;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address,
      'phone': phone,
      'website': website,
      'company': company,
    };
  }
}
