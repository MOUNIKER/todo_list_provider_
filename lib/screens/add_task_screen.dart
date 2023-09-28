// lib/screens/add_task_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider_/models/task.dart';
import 'package:todo_list_provider_/providers/task_provider.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController dueDateController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Task Title'),
            ),
            TextField(
              controller: dueDateController,
              decoration: const InputDecoration(labelText: 'Due Date (YYYY-MM-DD)'),
            ),
            ElevatedButton(
              onPressed: () {
                final String title = titleController.text;
                final String dueDateString = dueDateController.text;

                if (title.isNotEmpty && dueDateString.isNotEmpty) {
                  final DateTime dueDate = DateTime.parse(dueDateString);

                  final Task newTask = Task(
                    title: title,
                    dueDate: dueDate,
                  );
                 Provider.of<TaskProvider>(context, listen: false)
                     .addTask(newTask);

                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
