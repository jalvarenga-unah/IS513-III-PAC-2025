import 'package:flutter/material.dart';
import 'package:todo_app/src/models/todo.dart';
import 'package:todo_app/src/providers/todo_provider.dart';

class ItemList extends StatelessWidget {
  ItemList({super.key, required this.todo});

  final provider = TodoProvider();
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.completed
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      subtitle: Text(todo.description ?? ''),
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Icon(
          todo.completed ? Icons.check_rounded : Icons.calendar_month_outlined,
          color: Colors.blue[800],
        ),
      ),
      trailing: Checkbox(
        checkColor: Colors.blue,
        activeColor: Colors.blue[100],
        value: todo.completed,
        onChanged: (value) async {
          // setState(() {});

          final result = await provider.markAsComplete(
            docId: todo.id,
            value: value ?? false,
          );
          // if (result)
          // todo.completed = value ?? false;
        },
      ),
    );
  }
}
