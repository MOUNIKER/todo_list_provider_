class Task {
  final String title;
  final DateTime dueDate;
  bool isCompleted;

  Task({
    required this.title,
    required this.dueDate,
    this.isCompleted = false,
  });
}
