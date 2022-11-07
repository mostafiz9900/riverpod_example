import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../model/todo.dart';
import '../providers/todos_notifier.dart';

class ChangeNotifyPage extends StatelessWidget {
  const ChangeNotifyPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('ChangeNotifyPage'),
        leading: InkWell(
          onTap: () {
            // Navigator.of(context, rootNavigator: true).pop(context);
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new_sharp),
        ),
        actions: [
          Consumer(builder: (context, ref, child) {
            final todo = ref.read(todosProvider);
            Todo model =
                Todo(id: '2', description: 'Express Js', completed: false);
            return IconButton(
                onPressed: () => todo.addTodo(model), icon: Icon(Icons.add));
          })
        ],
      ),
      body: const TodoListView(),
    );
  }
}

class TodoListView extends ConsumerWidget {
  const TodoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // rebuild the widget when the todo list changes
    List<Todo> todos = ref.watch(todosProvider).todos;

    // Let's render the todos in a scrollable list view
    return ListView(
      children: [
        for (final todo in todos)
          CheckboxListTile(
            value: todo.completed,
            // When tapping on the todo, change its completed status
            onChanged: (value) =>
                ref.read(todosProvider.notifier).toggle(todo.id),
            title: Text(todo.description),
          ),
      ],
    );
  }
}
