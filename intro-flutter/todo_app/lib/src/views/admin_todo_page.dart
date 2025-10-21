import 'package:flutter/material.dart';

class AdminTodoPage extends StatelessWidget {
  const AdminTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Creación de una nueva tarea')),
      body: Column(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[300],
        onPressed: () {
          // navegar a otra pantalla
          Navigator.of(context).pop();
        },
        child: Icon(Icons.add, color: Colors.blue[50]),
      ),
    );
  }
}
