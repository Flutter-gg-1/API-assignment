
import 'package:api_lab/model/geo_model.dart';

class AddressModel {
  AddressModel({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory AddressModel.fromJson(Map json) {
    final geo = json['geo'];
    return AddressModel(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: GeoModel.fromJson(
        geo as Map<String, dynamic>,
      ),
    );
  }

  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoModel geo;

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo,
    };
  }
}
