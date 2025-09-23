import 'CuentaBancaria.dart';

void main() {
  final cuenta1 = CuentaBancaria(titular: 'Juan Perez', numeroCuenta: 12345);

  cuenta1.deposito(500);
  cuenta1.deposito(300);
  //TODO: manejar error
  cuenta1.deposito(-300); // cuenta como "retiro"

  print(cuenta1.saldo); // es una función (getter)

  final cuenta2 = CuentaBancaria(titular: 'Maria Gomez', numeroCuenta: 67890);
}
