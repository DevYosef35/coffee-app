class Category {
  String? id;
  String? name;
  String? description;
  String? imagePath;

  Category({
    this.id,
    this.name,
    this.description,
    this.imagePath,
  });

  Category copyWith({
    String? id,
    String? name,
    String? description,
    String? imagePath,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imagePath': imagePath,
    };
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      imagePath: json['imagePath'] as String?,
    );
  }

  @override
  String toString() =>
      "Category(id: $id,name: $name,description: $description,imagePath: $imagePath)";

  @override
  int get hashCode => Object.hash(id, name, description, imagePath);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          imagePath == other.imagePath;
}
