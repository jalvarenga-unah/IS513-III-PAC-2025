import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/src/models/todo.dart';
import 'package:todo_app/src/providers/todo_provider.dart';
import 'package:todo_app/src/shared/utils.dart';
import 'package:todo_app/src/widgets/item_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final todoProvider = TodoProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.red[50],
                    radius: 40,
                    child: FirebaseAuth.instance.currentUser?.photoURL == null
                        ? Text(
                            'JA',
                            style: TextStyle(
                              fontSize: 42,
                              color: Colors.red[400],
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              FirebaseAuth.instance.currentUser!.photoURL!,
                            ),
                          ),
                  ),
                  Text('Juan Alvarenga'),
                ],
              ),
            ),

            ListTile(leading: Icon(Icons.home), title: Text('Inicio')),
            ListTile(
              leading: Icon(Icons.important_devices),
              title: Text('Importantes'),
            ),
            ListTile(leading: Icon(Icons.warning), title: Text('Críticas')),
            ListTile(
              leading: Icon(Icons.calendar_month_rounded),
              title: Text('Calendario'),
              onTap: () {
                //
                context.pop();
                context.pushNamed('new-todo');
              },
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Configuraciones'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.calendar_month_rounded),
              title: Text('Calendario'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('TODO-App'),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut(); // cierra la sesión

              if (!context.mounted) return;

              context.replace('/login');
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: todoProvider.getAllTodosStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          // if(snapshot.hasData){
          // }

          final List<Todo> todos = snapshot.data!;

          print(todos);

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                confirmDismiss: (direction) async {
                  //? Para actualizar
                  if (direction == DismissDirection.endToStart) {
                    context.pushNamed(
                      'update-todo',
                      pathParameters: {'id': todos[index].id},
                      extra: todos[index],
                    );
                    return false;
                  }

                  //? Para eliminar
                  return await Utils.showConfirm(
                    context: context,
                    confirmButton: () {
                      FirebaseFirestore.instance
                          .collection('todos')
                          .doc(todos[index].id)
                          .delete();

                      if (!context.mounted) return;
                      context.pop(todos.remove(todos[index]));
                    },
                  );
                },
                onDismissed: (direction) {
                  print(direction);
                },
                background: Container(
                  padding: EdgeInsets.only(left: 16),
                  color: Colors.red,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.red[50],
                      size: 30,
                    ),
                  ),
                ),
                secondaryBackground: Container(
                  padding: EdgeInsets.only(right: 16),
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Modificar',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[50],
                        ),
                      ),
                      SizedBox(width: 12),
                      Icon(
                        Icons.edit_outlined,
                        color: Colors.blue[50],
                        size: 30,
                      ),
                    ],
                  ),
                ),

                key: Key(todos[index].id),
                child: ItemList(todo: todos[index]),
              );
            },
          );

          // información de todo lo que ocurre con el future
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
