import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:todo_app_using_getx/model/todo_model.dart';

class TaskController extends GetxController {
  RxList<TodoModel> tasks = <TodoModel>[].obs;
  RxList<TodoModel> doneTasks = <TodoModel>[].obs;

  void addTask(String title) {
    tasks.add(TodoModel(title: title));
  }

  void removeTask(int index) {
    tasks.removeAt(index);
  }

  void toggleTask(int index) {
    tasks[index].isDone = !tasks[index].isDone;
    tasks.refresh();
  }

  void getDoneTasks() {
    doneTasks.assignAll(tasks.where((e) => e.isDone == true).toList());
    debugPrint(doneTasks.length.toString());
  }
}
