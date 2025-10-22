import 'package:flutter/material.dart';

class AdminTodoPage extends StatelessWidget {
  AdminTodoPage({super.key});

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Creación de una nueva tarea')),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                label: Text('Titulo'),
                hint: Text('Eje. Crear opción de eliminar'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                // suffixIcon: IconButton(
                //   icon: Icon(Icons.visibility),
                //   onPressed: () {},
                // ),
                prefixIcon: Icon(Icons.text_fields_rounded),
              ),
              maxLines: 1,
              maxLength: 50,
              obscureText: false,
              keyboardType: TextInputType.visiblePassword,
              // style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 16),
            TextField(controller: descriptionController),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[300],
        onPressed: () {
          print(titleController.text); // obteniendo el valor del Title
        },
        child: Icon(Icons.add, color: Colors.blue[50]),
      ),
    );
  }
}
