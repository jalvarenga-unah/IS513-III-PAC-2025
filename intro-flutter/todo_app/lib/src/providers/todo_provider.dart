import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/src/models/todo.dart';

class TodoProvider {
  Future<List<Todo>> getAllTodos() async {
    final db = FirebaseFirestore.instance;

    final collectionRefTodos = db.collection('todos');

    final snapshotTodos = await collectionRefTodos.get();

    final todos = List<Todo>.from(
      snapshotTodos.docs.map((todo) {
        // final test = {
        //   'id':todo.id,
        //   'title':todo.data()['title'],
        //   'description':todo.data()['description'],
        //   'completed':todo.data()['completed'],
        // };

        return Todo.fromJson({'id': todo.id, ...todo.data()});
      }),
    );

    return todos;
  }

  Stream<List<Todo>> getAllTodosSync() async {
    final db = FirebaseFirestore.instance;

    final collectionRefTodos = db.collection('todos');

    final snapshotTodos = await collectionRefTodos.snapshots();

    final todos = List<Todo>.from(
      snapshotTodos.docs.map((todo) {
        // final test = {
        //   'id':todo.id,
        //   'title':todo.data()['title'],
        //   'description':todo.data()['description'],
        //   'completed':todo.data()['completed'],
        // };

        return Todo.fromJson({'id': todo.id, ...todo.data()});
      }),
    );

    return todos;
  }

  Future<Todo> saveTodo(Map<String, dynamic> todo) async {
    final db = FirebaseFirestore.instance;

    final collectionRefTodos = db.collection('todos');

    final newTodo = await collectionRefTodos.add(todo);

    return Todo.fromJson({'id': newTodo.id, ...todo});
  }

  Future<bool> markAsComplete({
    required String docId,
    required bool value,
  }) async {
    try {
      final db = FirebaseFirestore.instance;

      final docRef = db.collection('todos').doc(docId);

      await docRef.update({'completed': value});
      return true;
    } catch (e) {
      return false;
    }
  }
}
