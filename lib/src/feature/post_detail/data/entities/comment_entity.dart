class CommentEntity {
  int id;
  int? postId;
  String? name;
  String? email;
  String? body;

  CommentEntity({
    required this.id,
    this.postId,
    this.name,
    this.email,
    this.body,
  });

  factory CommentEntity.fromJSON(Map<String, dynamic> json) => CommentEntity(
        id: json['id'],
        postId: json['postId'],
        name: json['name'],
        email: json['email'],
        body: json['body'],
      );

  Map<String, dynamic> toJSON() => {
        'id': id,
        'postId': postId,
        'name': name,
        'email': email,
        'body': body,
      };
}
