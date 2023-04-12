import 'package:mobx/mobx.dart';
import 'package:todos_mobx/_model/todo.dart';
part 'todo_list.g.dart';

class TodoList = TodoListBase with _$TodoList;

abstract class TodoListBase with Store {
  @observable
  ObservableList list = ObservableList<Todo>();

  // Add new todo to list
  @action
  void addNewTodo(Todo todo) {
    list.add(todo);
  }

  // Remove specific todo from list
  @action
  void removeTodo(Todo todo) {
    list.remove(todo);
  }
}