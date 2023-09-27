class PostDetailEntity {
  int id;
  int? userId;
  String? title;
  String? body;

  PostDetailEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory PostDetailEntity.fromJSON(Map<String, dynamic> json) =>
      PostDetailEntity(
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
