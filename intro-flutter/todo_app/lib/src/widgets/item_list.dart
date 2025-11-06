import 'package:flutter/material.dart';
import 'package:todo_app/src/models/todo.dart';
import 'package:todo_app/src/providers/todo_provider.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key, required this.todo});

  final Todo todo;

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  void initState() {
    super.initState();
  }

  final provider = TodoProvider();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.todo.title,
        style: TextStyle(
          decoration: widget.todo.completed
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      subtitle: Text(widget.todo.description ?? ''),
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Icon(
          widget.todo.completed
              ? Icons.check_rounded
              : Icons.calendar_month_outlined,
          color: Colors.blue[800],
        ),
      ),
      trailing: Checkbox(
        checkColor: Colors.blue,
        activeColor: Colors.blue[100],
        value: widget.todo.completed,
        onChanged: (value) async {
          setState(() {});

          final result = await provider.markAsComplete(
            docId: widget.todo.id,
            value: value ?? false,
          );
          // if (result)
          // widget.todo.completed = value ?? false;
        },
      ),
    );
  }
}
