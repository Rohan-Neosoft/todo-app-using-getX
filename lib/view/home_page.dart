// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_using_getx/controller/task_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  TaskController controller = Get.put(TaskController());
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        leading: IconButton(
          padding: EdgeInsets.symmetric(horizontal: 20),
          iconSize: 30,
          icon: Icon(Icons.checklist),
          onPressed: () {
            Get.toNamed('/done');
          },
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 20),
            iconSize: 30,
            icon: Icon(Get.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.tasks.length,
                itemBuilder: (context, index) {
                  final todo = controller.tasks[index];
                  return ListTile(
                    title: Text(todo.title),
                    leading: Checkbox(
                      value: todo.isDone,
                      onChanged: (_) {
                        controller.toggleTask(index);
                      },
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        Get.snackbar('Task Deleted', '');
                        controller.removeTask(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            elevation: 5,
            isScrollControlled: true,
            builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 100,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(hintText: 'Add a task'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.addTask(titleController.text);
                      titleController.clear();
                      Get.back();
                    },
                    child: Text('Create New'),
                  )
                ],
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
