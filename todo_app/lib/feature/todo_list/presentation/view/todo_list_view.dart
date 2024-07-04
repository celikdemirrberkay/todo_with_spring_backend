import 'package:dart_vader/dart_vader.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/feature/todo_list/presentation/view_model/todo_list_viewmodel.dart';

/// To do list view
class TodoListView extends StackedView<TodoListViewmodel> {
  ///
  const TodoListView({super.key});

  @override
  Widget builder(BuildContext context, viewModel, Widget? child) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: context.screenSizes.height,
          width: context.screenSizes.width,
          child: ListView.builder(
            itemCount: 5,
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
  TodoListViewmodel viewModelBuilder(BuildContext context) => TodoListViewmodel();
}
