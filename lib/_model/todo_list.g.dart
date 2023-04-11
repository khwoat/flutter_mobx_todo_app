// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoList on TodoListBase, Store {
  late final _$todoListAtom =
      Atom(name: '_TodoListBase.todoList', context: context);

  @override
  ObservableList<dynamic> get list {
    _$todoListAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<dynamic> value) {
    _$todoListAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$_TodoListBaseActionController =
      ActionController(name: '_TodoListBase', context: context);

  @override
  void addNewTodo(Todo todo) {
    final _$actionInfo = _$_TodoListBaseActionController.startAction(
        name: '_TodoListBase.addNewTodo');
    try {
      return super.addNewTodo(todo);
    } finally {
      _$_TodoListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTodo(Todo todo) {
    final _$actionInfo = _$_TodoListBaseActionController.startAction(
        name: '_TodoListBase.removeTodo');
    try {
      return super.removeTodo(todo);
    } finally {
      _$_TodoListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todoList: ${list}
    ''';
  }
}
