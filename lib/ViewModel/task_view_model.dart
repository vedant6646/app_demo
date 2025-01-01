import 'package:demo/Models/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/task_database.dart';

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super([]);

  Future<void> loadTasks() async {
    state = await TaskDatabase.instance.getTasks();
  }

  Future<void> addTask(Task task) async {
    await TaskDatabase.instance.insertTask(task);
    loadTasks();
  }

  Future<void> updateTask(Task task) async {
    await TaskDatabase.instance.updateTask(task);
    loadTasks();
  }

  Future<void> deleteTask(int id) async {
    await TaskDatabase.instance.deleteTask(id);
    loadTasks();
  }
}

final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier();
});