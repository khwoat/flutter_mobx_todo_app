import 'package:mobx/mobx.dart';
part 'todo.g.dart';

class Todo = TodoBase with _$Todo;

abstract class TodoBase with Store {
  TodoBase(this.title, this.description, this.done);

  @observable
  String title = "";
  
  @observable
  String description = "";

  @observable
  bool done = false;

  @action
  void update(String title, String description) {
    this.title = title;
    this.description = description;
  }

}