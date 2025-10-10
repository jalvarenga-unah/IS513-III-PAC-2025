import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key, required this.todo});

  final Map<String, dynamic> todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo['title']),
      subtitle: Text(todo['description']),
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Icon(
          todo['completed']
              ? Icons.check_rounded
              : Icons.calendar_month_outlined,
          color: Colors.blue[800],
        ),
      ),
      trailing: Checkbox(
        checkColor: Colors.blue,
        activeColor: Colors.blue[100],
        value: todo['completed'],
        onChanged: (value) {
          todo['completed'] = value;
        },
      ),
    );
  }
}
