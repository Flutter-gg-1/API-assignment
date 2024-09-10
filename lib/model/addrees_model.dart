import 'package:api/model/geo_model.dart';

class AddressModel {
  AddressModel({
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
  late final GeoModel geo;
  
  AddressModel.fromJson(Map<String, dynamic> json){
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
    geo = GeoModel.fromJson(json['geo']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['street'] = street;
    data['suite'] = suite;
    data['city'] = city;
    data['zipcode'] = zipcode;
    data['geo'] = geo.toJson();
    return data;
  }
}
