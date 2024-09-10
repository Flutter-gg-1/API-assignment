class GeoModel {
  GeoModel({
    required this.lat,
    required this.lng,
  });
  late final String lat;
  late final String lng;
  
  GeoModel.fromJson(Map<String, dynamic> json){
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}