



class TweetModel {
    TweetModel({
        required this.title,
        required this.description,
        required this.userId,
        required this.createdAt,
        required this.updatedAt,
        required this.id,
    });

    String title;
    String description;
    int userId;
    DateTime createdAt;
    DateTime updatedAt;
    int id;

    factory TweetModel.fromJson(Map<String, dynamic> json) => TweetModel(
        title: json["title"],
        description: json["description"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "id": id,
    };
}