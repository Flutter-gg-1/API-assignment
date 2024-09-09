class Album {
  final int userId;
  final int id;
  final String title;
  
  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
    };
  }
}
