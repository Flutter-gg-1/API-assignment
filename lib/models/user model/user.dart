import 'package:api_assignment/models/user%20model/address.dart';
import 'package:api_assignment/models/user%20model/company.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory User.fromJson(Map json) {
    final address = json['address'];
    final company = json['company'];
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address.fromJson(
        address as Map<String, dynamic>,
      ),
      phone: json['phone'],
      website: json['website'],
      company: Company.fromJson(
        company as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address.toJson(),
      'phone': phone,
      'website': website,
      'company': company.toJson(),
    };
  }
}
