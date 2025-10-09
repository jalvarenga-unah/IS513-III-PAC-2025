import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//? Tipos de Widgets:
// StatelessWidget -> Son Widgets que no tienen estado mutable
// StatefulWidget -> Son Widgets que tienen estado mutable

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 10,
          leading: Icon(Icons.person_2_sharp),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings, color: Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.exit_to_app, color: Colors.white),
            ),
          ],
          centerTitle: false,
          backgroundColor: Colors.teal[700],
          title: Text(
            'Mi Primer App',
            style: TextStyle(color: Colors.teal[50]),
          ),
        ),
        // appBar: AppBar(backgroundColor: Color(0xFF242424)),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hola mundo',
                  style: TextStyle(fontSize: 50, color: Colors.black87),
                ),
                Text(
                  'Hola mundo',
                  style: TextStyle(fontSize: 50, color: Colors.black87),
                ),
                Text(
                  'Hola mundo',
                  style: TextStyle(fontSize: 50, color: Colors.black87),
                ),
                Text(
                  'Hola mundo',
                  style: TextStyle(fontSize: 50, color: Colors.black87),
                ),
                Text(
                  'Hola mundo',
                  style: TextStyle(fontSize: 50, color: Colors.black87),
                ),
                Text(
                  'Hola mundo',
                  style: TextStyle(fontSize: 50, color: Colors.black87),
                ),
                Text(
                  'Hola mundo',
                  style: TextStyle(fontSize: 50, color: Colors.black87),
                ),
                Text(
                  'Hola mundo',
                  style: TextStyle(fontSize: 50, color: Colors.black87),
                ),
                Text(
                  'Hola mundo',
                  style: TextStyle(fontSize: 50, color: Colors.black87),
                ),
                Text(
                  'Hola mundo',
                  style: TextStyle(fontSize: 50, color: Colors.black87),
                ),
                Text(
                  'Hola mundo',
                  style: TextStyle(fontSize: 50, color: Colors.black87),
                ),
                Text(
                  'Hola mundo',
                  style: TextStyle(fontSize: 50, color: Colors.black87),
                ),
                Text(
                  'Hola mundo',
                  style: TextStyle(fontSize: 50, color: Colors.black87),
                ),
                Text(
                  'Hola mundo',
                  style: TextStyle(fontSize: 50, color: Colors.black87),
                ),
                Text(
                  'Hola mundo',
                  style: TextStyle(fontSize: 50, color: Colors.black87),
                ),
                Text(
                  'Hola mundo',
                  style: TextStyle(fontSize: 50, color: Colors.black87),
                ),
                Text(
                  'Hola mundo',
                  style: TextStyle(fontSize: 50, color: Colors.black87),
                ),
                Text(
                  'Hola mundo',
                  style: TextStyle(fontSize: 50, color: Colors.black87),
                ),
                Text(
                  '$contador',
                  style: TextStyle(fontSize: 45, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
        // floatingActionButtonLocation:
        //     FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            FloatingActionButton(
              backgroundColor: Colors.red[100],
              child: Icon(
                Icons.exposure_minus_1_outlined,
                color: Colors.red[900],
              ),
              onPressed: () {
                setState(() {});

                contador--;
                print(contador);
              },
            ),
            SizedBox(height: 12),
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                setState(() {});

                contador++;
                print(contador);
              },
            ),
          ],
        ),
      ),
    ); // widget Padre
  }
}
