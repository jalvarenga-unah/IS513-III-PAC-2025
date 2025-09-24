import 'CuentaBancaria.dart';

void main() {
  final cuenta1 = CuentaBancaria(titular: 'Juan Perez', numeroCuenta: 12345);

  try {
    cuenta1.deposito(500);
    cuenta1.deposito(300);
    cuenta1.deposito(
      -300,
    ); // esta linea impide que se continue con la ejecucion
  } catch (e) {
    print(e);
  }

  cuenta1.retiro(200);

  print(cuenta1.saldo); // es una función (getter)

  final cuenta2 = CuentaBancaria.plazoFijo(
    titular: 'Maria Gomez',
    numeroCuenta: 67890,
  );
  final cuenta3 = CuentaBancaria.cuentaEmpresarial(
    titular: 'Empresa XYZ',
    numeroCuenta: 11223,
    tipoCuenta: 'Cuenta Empresarial',
  );

  print(cuenta1.toString());
  print(cuenta2.toString());
  print(cuenta3.toString());

  final datosCuenta = {
    'titular': 'Carlos Lopez',
    'numeroCuenta': 44556,
    'tipoCuenta': 'Ahorros',
  };

  final cuenta4 = CuentaBancaria.fromJson(datosCuenta);
  print(cuenta4.toString());
}
