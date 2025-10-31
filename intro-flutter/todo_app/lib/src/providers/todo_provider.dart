import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/src/models/todo.dart';

class TodoProvider {
  Future<List<Todo>> getAllTodos() async {
    final db = FirebaseFirestore.instance;

    final collectionRefTodos = db.collection('todos');

    final snapshotTodos = await collectionRefTodos.get();

    final todos = List<Todo>.from(
      snapshotTodos.docs.map((todo) {
        return Todo.fromJson(todo.data());
      }),
    );

    return todos;
  }
}
