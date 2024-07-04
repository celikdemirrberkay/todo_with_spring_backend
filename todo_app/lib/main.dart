import 'package:flutter/material.dart';
import 'package:todo_app/feature/todo_list/presentation/view/todo_list_view.dart';

void main() {
  runApp(const TodoWithBackend());
}

/// Root of the application
class TodoWithBackend extends StatelessWidget {
  ///
  const TodoWithBackend({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo app with Spring boot backend',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const TodoListView(),
    );
  }
}
