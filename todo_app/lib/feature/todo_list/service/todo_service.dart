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
  Future<String?> addTodo(Todo todo) async {
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
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return e.response?.data as String?;
      } else {
        return 'Unexpected error occured';
      }
    } catch (e) {
      return 'Unexpected error occured';
    }
  }

  /// ------------ Delete `todo` from db ------------
  @override
  Future<String?> deleteTodoById(Todo todo) async {
    try {
      final response = await dio.delete<String>(
        '${DevEnvironment.baseUrl}/delete/${todo.id}',
      );
      return response.data!;
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return e.response?.data as String?;
      } else {
        return 'Unexpected error occured';
      }
    } catch (e) {
      return 'Unexpected error occured';
    }
  }

  /// ------------ Fetch all `todo` from db ------------
  @override
  Future<List<Todo>?> getTodoList() async {
    try {
      /// Get response
      final response = await dio.get<List<dynamic>?>(
        '${DevEnvironment.baseUrl}/todos',
      );

      final dataList = response.data;
      if (dataList != null) {
        final todoListAsMap = dataList.map((item) => item as Map<String, dynamic>).toList();

        /// Return list of `todo` map
        return todoListAsMap.map(Todo.fromJson).toList();
      }

      return null;

      /// Catch error
    } on DioException catch (_) {
      return null;
    }
  }

  /// ------------ Update `todo` to db ------------
  @override
  Future<String?> updateTodo(Todo todo) async {
    try {
      final response = await dio.put<String?>(
        '${DevEnvironment.baseUrl}/update/${todo.id}',
        data: todo.toJson(),
      );
      return response.data;
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return e.response?.data as String?;
      } else {
        return 'Unexpected error occured';
      }
    } catch (e) {
      return 'Unexpected error occured';
    }
  }
}
