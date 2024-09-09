class AddressGeo {
  final String lat;
  final String lng;

  AddressGeo({
    required this.lat,
    required this.lng,
  });

  factory AddressGeo.fromJson(Map json) {
    return AddressGeo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}
