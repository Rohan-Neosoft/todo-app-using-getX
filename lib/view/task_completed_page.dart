import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:todo_app_using_getx/controller/task_controller.dart';

class TaskCompletedPage extends StatelessWidget {
  TaskCompletedPage({super.key});

  // Dependency Injection
  TaskController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.getDoneTasks();
    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Task'),
      ),
      body: ListView.builder(
        itemCount: controller.doneTasks.length,
        itemBuilder: (context, index) {
          final todo = controller.doneTasks[index];

          return ListTile(
            title: Text(todo.title),
            leading: const Icon(Icons.check, color: Colors.green),
          );
        },
      ),
    );
  }
}
