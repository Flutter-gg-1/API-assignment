import 'package:api_assignment/models/user%20model/address_geolocation.dart';

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final AddressGeo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map json) {
    final geo = json['geo'];
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: AddressGeo.fromJson(
        geo as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo.toJson(),
    };
  }

  @override
  String toString() {
    return 'Street: $street\nSuite: $suite\nCity: $city\nZipcode: $zipcode\nGeo Location: ${geo.toJson()}';
  }
}
