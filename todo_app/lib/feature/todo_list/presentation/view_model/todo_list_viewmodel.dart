import 'package:stacked/stacked.dart';
import 'package:todo_app/core/model/todo.dart';
import 'package:todo_app/feature/todo_list/service/todo_service.dart';

/// 'Todo' list viewmodel
class TodoListViewmodel extends BaseViewModel {
  ///
  TodoListViewmodel(this._todoService) {}

  List<Todo>? _todoList = [];
  List<Todo>? get todoList => _todoList;

  /// 'Todo' service
  final TodoService _todoService;

  /// Get `todo` list
  Future<List<Todo>?> getTodoList() async {
    setBusy(true);
    _todoList = await _todoService.getTodoList();
    setBusy(false);
    return _todoList;
  }
}
