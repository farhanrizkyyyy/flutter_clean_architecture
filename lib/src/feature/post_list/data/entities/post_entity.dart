class PostEntity {
  int id;
  int? userId;
  String? title;
  String? body;

  PostEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory PostEntity.fromJSON(Map<String, dynamic> json) => PostEntity(
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        body: json['body'],
      );

  Map<String, dynamic> toJSON() => {
        'id': id,
        'userId': userId,
        'title': title,
        'body': body,
      };
}
