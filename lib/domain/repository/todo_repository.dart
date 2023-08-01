

import 'dart:convert';

import 'package:learn_storage/data/local_data_source.dart';
import 'package:learn_storage/domain/model/todo.dart';

abstract class TodoRepository{
  Future<bool> storeTodo(Todo todo);
  List<Todo> readTodo();
  Future<bool> delateTodo(Todo todo);
  Future<bool> clareCache();
}
class TodoRepositoryImplements implements TodoRepository{
  final LocalDataSource dataSource;
  const TodoRepositoryImplements({required this.dataSource});
  @override
  Future<bool> clareCache() {
    return dataSource.remove(StorageTodoKey.todo);
  }

  @override
  Future<bool> delateTodo(Todo todo) {
    final list = readTodo();
    list.remove(todo);
    final json = list.map((e) => e.toJson()).toList();
    final data = jsonEncode(json);
    return dataSource.store(StorageTodoKey.todo, data);
  }


  @override
  List<Todo> readTodo() {
    String data = dataSource.read(StorageTodoKey.todo) ?? "[]";
    final json = jsonDecode(data) as List;
    return json.map((item) => Todo.fromJson(item as Map<String,dynamic>)).toList();
  }

  @override
  Future<bool> storeTodo(Todo todo) async{
    final list = readTodo();
    list.add(todo);
    final json = list.map((todo) => todo.toJson()).toList();
    final data = jsonEncode(json);
    return await dataSource.store(StorageTodoKey.todo, data);
  }
}