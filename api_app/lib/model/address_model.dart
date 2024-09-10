import 'package:api_app/model/geo_model.dart';

class Address {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });
  late final String street;
  late final String suite;
  late final String city;
  late final String zipcode;
  late final Geo geo;

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
    geo = Geo.fromJson(json['geo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['street'] = street;
    _data['suite'] = suite;
    _data['city'] = city;
    _data['zipcode'] = zipcode;
    _data['geo'] = geo.toJson();
    return _data;
  }
}