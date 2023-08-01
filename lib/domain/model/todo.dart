class Todo {
  int id;
  String title;
  String description;
  String? imageUrl;

  Todo(
      {required this.id, required this.title, required this.description, required this.imageUrl,});

  factory Todo.fromJson(Map<String, Object?> json) =>
      Todo(id: json["id"] as int, title: json["title"] as String,
          description: json["description"] as String,
          imageUrl: json["imageUrl"] as String?);

  Map<String, Object?> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "imageUrl": imageUrl,
  };

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, description: $description, imageUrl: $imageUrl}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode => Object.hash(id, title);
}