
class GeoModel {
  GeoModel({
    required this.lat,
    required this.lng,
  });

  factory GeoModel.fromJson(Map json) {
    return GeoModel(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  final String lat;
  final String lng;

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}
