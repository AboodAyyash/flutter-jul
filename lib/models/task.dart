class Task {
  String name;
  int id;
  String description;
  DateTime deadline;
  DateTime createdDate;
  int categoryId;
  bool isChecked;
  int userId;

  Task({
    required this.name,
    required this.id,
    required this.description,
    required this.deadline,
    required this.createdDate,
    required this.categoryId,
    required this.isChecked,
    required this.userId
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'userId': userId,
      'categoryId': categoryId,
      'isChecked': isChecked,
      'createdDate': createdDate,
      'deadline': deadline,
      'description': description
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      name: map['name'],
      userId: map['userId'],
      deadline: map['deadline'],
      createdDate: map['createdDate'],
      description: map['description'],
      isChecked: map['isChecked'],
      categoryId: map['categoryId'],
    );
  }
}