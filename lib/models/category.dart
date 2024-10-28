// id , name

class Category {
  String name;
  int id;
  int userId;
  Category({required this.id, required this.name, required this.userId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'userId': userId,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
      userId: map['userId'],
    );
  }
}