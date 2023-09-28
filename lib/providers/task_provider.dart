// lib/providers/task_provider.dart

import 'package:flutter/material.dart';
import 'package:todo_list_provider_/models/task.dart';

class TaskProvider extends ChangeNotifier {
 final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTaskCompletion(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
