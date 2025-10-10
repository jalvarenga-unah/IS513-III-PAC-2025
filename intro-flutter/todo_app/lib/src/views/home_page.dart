import 'package:flutter/material.dart';
import 'package:todo_app/api/todos.dart';
import 'package:todo_app/src/widgets/item_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TODO-App')),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemList(todo: todoList[index]);
        },
      ),
    );
  }
}
