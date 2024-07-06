import 'package:dart_vader/dart_vader.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/feature/todo_list/presentation/view_model/todo_list_viewmodel.dart';
import 'package:todo_app/feature/todo_list/service/todo_service.dart';

/// To do list view
class TodoListView extends StackedView<TodoListViewmodel> {
  ///
  const TodoListView({super.key});

  ///
  @override
  void onViewModelReady(TodoListViewmodel viewModel) async {
    await viewModel.getTodoList();
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(BuildContext context, viewModel, Widget? child) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: context.screenSizes.height,
          width: context.screenSizes.width,
          child: viewModel.isBusy
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: viewModel.todoList?.length ?? 0,
                  itemBuilder: (context, index) => _todosListTile(),
                ),
        ),
      ),
    );
  }

  Widget _todosListTile() => const ListTile(
        title: Text('Todo title'),
        subtitle: Text(
          'Todo',
          maxLines: 1,
          overflow: TextOverflow.clip,
        ),
        trailing: Icon(Icons.delete),
      );

  @override
  TodoListViewmodel viewModelBuilder(BuildContext context) => TodoListViewmodel(TodoService(Dio()));
}
