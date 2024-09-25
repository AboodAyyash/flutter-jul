class Task {
  String name;
  int id;
  String description;
  DateTime deadline;
  DateTime createdDate;
  int categoryId;
  bool isChecked;

  Task({
    required this.name,
    required this.id,
    required this.description,
    required this.deadline,
    required this.createdDate,
    required this.categoryId,
    required this.isChecked,
  });
}
