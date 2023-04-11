import 'package:mobx/mobx.dart';
import 'package:todos_mobx/_model/todo.dart';
part 'todo_list.g.dart';

class TodoList = TodoListBase with _$TodoList;

abstract class TodoListBase with Store {
  @observable
  ObservableList list = ObservableList<Todo>();

  @action
  void addNewTodo(Todo todo) {
    list.add(todo);
  }

  @action
  void removeTodo(Todo todo) {
    list.remove(todo);
  }
}