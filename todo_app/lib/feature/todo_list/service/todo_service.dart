import 'dart:io';

import 'package:dio/dio.dart';
import 'package:todo_app/core/config/environment/env_dev.dart';
import 'package:todo_app/core/model/todo.dart';
import 'package:todo_app/feature/todo_list/service/interface/todo_service_interface.dart';

/// 'Todo' service operations
class TodoService extends TodoServiceInterface {
  ///
  TodoService(super.dio);

  /// ------------ Add `todo` to db ------------
  @override
  Future<String>? addTodo(Todo todo) async {
    /// Try post data
    try {
      /// Post data
      final response = await dio.post<void>(
        '${DevEnvironment.baseUrl}/add',
        data: todo.toJson(),
      );
      if (response.statusCode == HttpStatus.ok) {
        return 'Todo added successfully';
      } else {
        return 'Error occured';
      }

      /// Catch error
    } on DioException catch (error) {
      return error.message ?? 'Error occured';
    }
  }

  /// ------------ Delete `todo` from db ------------
  @override
  Future<String>? deleteTodoById(Todo todo) async {
    try {
      final response = await dio.delete<String>(
        '${DevEnvironment.baseUrl}/delete/${todo.id}',
      );
      return response.data!;
    } on DioException catch (e) {
      return e.message ?? 'Error occured';
    }
  }

  /// ------------ Fetch all `todo` from db ------------
  @override
  Future<List<Todo>>? getTodoList() async {
    try {
      final response = await dio.get<List<Map<String, dynamic>>>(
        '${DevEnvironment.baseUrl}/todos',
      );

      /// Return list of `todo` map
      return response.data!.map((e) => Todo.fromJson(e)).toList();

      /// Catch error
    } on DioException catch (_) {
      return <Todo>[];
    }
  }

  /// ------------ Update `todo` to db ------------
  @override
  Future<String>? updateTodo(Todo todo) async {
    try {
      final response = await dio.put<String>(
        '${DevEnvironment.baseUrl}/update/${todo.id}',
        data: todo.toJson(),
      );
      return response.data!;
    } on DioException catch (e) {
      return e.message ?? 'Error occured';
    }
  }
}
