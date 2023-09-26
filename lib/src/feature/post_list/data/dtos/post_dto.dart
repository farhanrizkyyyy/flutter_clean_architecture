class PostDTO {
  int? id;
  int? userId;
  String? title;
  String? body;

  PostDTO({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

  factory PostDTO.fromJSON(Map<String, dynamic> json) => PostDTO(
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        body: json['body'],
      );
}
