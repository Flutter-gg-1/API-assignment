class AlbumModel {
  AlbumModel({
    required this.userId,
    required this.id,
    required this.title,
  });
  late final int userId;
  late final int id;
  late final String title;
  
  AlbumModel.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}