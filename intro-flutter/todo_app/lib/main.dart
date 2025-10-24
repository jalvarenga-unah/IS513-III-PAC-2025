import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/src/views/admin_todo_page.dart';
import 'package:todo_app/src/views/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/todos',
        routes: [
          GoRoute(
            path: '/todos',
            name: 'todo-list',
            builder: (state, context) => HomePage(),
            routes: [
              GoRoute(
                path: '/create', //?   /todos/create
                name: 'new-todo',
                builder: (context, state) => AdminTodoPage(),
              ),
              GoRoute(
                path: '/:id', //?   /todos/124
                name: 'update-todo',
                builder: (context, state) {
                  print(state.pathParameters);
                  final todo = state.extra as Map<String, dynamic>;

                  return AdminTodoPage(todo: todo);
                },
              ),
            ],
          ),
        ],
      ),
      debugShowCheckedModeBanner: false,
      title: 'Todo - App',
      // initialRoute: '/',
      // home: AdminTodoPage(), // mi primer widget personalizado
      // routes: {
      //   '/': (context) => HomePage(),
      //   '/admin-todos': (context) => AdminTodoPage(),
      // },
    );
  }
}
