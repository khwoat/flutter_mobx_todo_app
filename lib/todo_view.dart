import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todos_mobx/_model/todo_list.dart';

import '_model/todo.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final todoList = TodoList();
    todoList.addNewTodo(Todo("1", "2", false));

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
                  builder: (context) => getCreateTodoDialog(context, todoList),
                );
              },
              child: const Text("Add todo"),
            )
          ],
        ));
  }

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
            Column(
              children: [
                Text(todo.title),
                Text(todo.description),
              ],
            ),
            
          ],
        );
      }),
    );
  }

  Widget getCreateTodoDialog(BuildContext context, TodoList todoList) {
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
}
