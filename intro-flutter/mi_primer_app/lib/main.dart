import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//? Tipos de Widgets:
// StatelessWidget -> Son Widgets que no tienen estado mutable
// StatefulWidget -> Son Widgets que tienen estado mutable

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.purple),
        body: Center(child: Text('Hola mundo')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Hola mundo');
          },
        ),
      ),
    ); // widget Padre
  }
}
