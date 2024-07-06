import 'package:dio/dio.dart';
import 'package:todo_app/core/model/todo.dart';

/// 'Todo' service operations interface
abstract class TodoServiceInterface {
  ///
  TodoServiceInterface(this.dio);

  /// Dio instance
  final Dio dio;

  /// Get `todo` list
  Future<List<Todo>?> getTodoList();

  /// Add `todo` to db
  Future<String?> addTodo(Todo todo);

  /// Update `todo` in db
  Future<String?> updateTodo(Todo todo);

  /// Delete `todo` by id
  Future<String?> deleteTodoById(Todo todo);
}
