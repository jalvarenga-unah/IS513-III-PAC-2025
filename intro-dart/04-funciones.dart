// metodo: no retorna nada
// funcion: retorna algo
void main() {
  saludar(); // ejecutando la funcion
  // print(saludar()); // la referencia de la funcion

  final mensaje = saludar2() + '!!!';

  // mensaje = 'otra cosa';

  print(mensaje);
  print(saludar3('Juan', 'Perez'));
  print(saludar3('Pedro'));
  print(saludar3('Alvarenga', 'Juan'));
  print(saludar4(nombre: 'Juan', apellido: 'Alvarenga'));
  print(saludar5('Ana', apellido: 'Valladares'));
}

void saludar() {
  print('Hola');
}

String saludar2() {
  return 'Hola de nuevo';
}

// Parametros posicionales
// Parametros con nombre (nombrados)

//? debo respetar el orden en que fueron definidos
//? los parametros, ojo: son obligatorios
String saludar3([String nombre = '', String? apellido]) {
  return 'Hola $nombre ${apellido ?? ''}';
}

// argumentos con nombre
String saludar4({required String nombre, String apellido = ''}) {
  return 'Hola $nombre ${apellido}';
}

String? saludar5(String nombre, {String apellido = ''}) {
  return 'Hola $nombre ${apellido}';
}
