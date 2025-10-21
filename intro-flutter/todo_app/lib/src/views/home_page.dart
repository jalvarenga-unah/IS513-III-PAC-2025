import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/api/todos.dart';
import 'package:todo_app/src/widgets/item_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('dibujando home');
    return Scaffold(
      appBar: AppBar(title: const Text('TODO-App')),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemList(todo: todoList[index]);
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[300],
        onPressed: () {
          // navegar a otra pantalla (Navigator 1.0)
          // Navigator.of(context).pushNamed('/admin-todos');
          // context.go('/home/admin-todos');
          context.goNamed('new-todo');
          // context.pushNamed('form');
        },
        child: Icon(Icons.add, color: Colors.blue[50]),
      ),
    );
  }
}
