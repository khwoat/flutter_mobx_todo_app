import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todos_mobx/_model/todo_list.dart';

import '_model/todo.dart';

class TodoView extends StatelessWidget {
  TodoView({super.key});

  final todoList = TodoList();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              child: Observer(builder: (_) {
                return ListView.builder(
                  itemCount: todoList.list.length,
                  itemBuilder: (context, index) =>
                      getEachTodoCard(context, todoList.list[index]),
                );
              }),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => getCreateTodoDialog(context),
                );
              },
              child: const Text("Add todo"),
            )
          ],
        ));
  }

  // Each card of todo
  Widget getEachTodoCard(BuildContext context, Todo todo) {
    return Card(
      child: Observer(builder: (_) {
        return Row(
          children: [
            Checkbox(
                value: todo.done,
                onChanged: (value) {
                  todo.done = value!;
                }),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todo.title),
                  Text(todo.description),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => getUpdateTodoDialog(context, todo),
                );
              },
              child: const Icon(
                Icons.update,
                size: 20,
              )
            ),

            GestureDetector(
              onTap: () => todoList.removeTodo(todo),
              child: const Icon(
                Icons.delete,
                size: 20,
              )
            ),
            
          ],
        );
      }),
    );
  }

  // Create todo dialog
  Widget getCreateTodoDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController desController = TextEditingController();
    return Card(
      child: Column(
        children: [
          const Text("Title:"),
          TextField(controller: titleController),
          const Text("Description:"),
          TextField(controller: desController),
          ElevatedButton(
              onPressed: () {
                todoList.addNewTodo(
                    Todo(titleController.text, desController.text, false));
                Navigator.of(context).pop();
              },
              child: const Text("Add"))
        ],
      ),
    );
  }

  // Update todo dialog
  Widget getUpdateTodoDialog(BuildContext context, Todo todo) {
    TextEditingController titleController = TextEditingController();
    TextEditingController desController = TextEditingController();
    return Card(
      child: Column(
        children: [
          const Text("Title:"),
          TextField(controller: titleController),
          const Text("Description:"),
          TextField(controller: desController),
          ElevatedButton(
              onPressed: () {
                todo.update(titleController.text, desController.text);
                Navigator.of(context).pop();
              },
              child: const Text("Update"))
        ],
      ),
    );
  }
}
