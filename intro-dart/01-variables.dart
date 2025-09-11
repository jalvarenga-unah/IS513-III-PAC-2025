//https://dartpad.dev/
void main() {
  // variables
  // funciones

  // estrictamente tipada
  String nombre = 'Juan';

  nombre = 'Enrique';
//   nombre = 12; // ❌ no se puede

  dynamic edad = 31; // int

  edad = 'Pedro';
  edad = true;

  print(edad);

  final String apellido;
  apellido = 'Alvarenga'; // String y constante
  // apellido = 'Rodas'; // ❌ no se puede

  const dni = 12345678; // int y constante, es inmutable

  double? estatura = null;

  estatura = 1.75;
  estatura = null;

  print(estatura);
}
