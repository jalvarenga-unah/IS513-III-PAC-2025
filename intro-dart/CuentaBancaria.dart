import 'dart:async';

class CuentaBancaria {
  // propieades

  final String titular;
  final int numeroCuenta;

  // propiedad privada
  double _saldo = 0;

  // Firma (constructor)
  CuentaBancaria({required this.titular, required this.numeroCuenta});

  // comportamientos / funciones o metodos

  double deposito(double monto) {
    saldo += monto;
    return saldo;
  }

  // getters y setters

  double get saldo => _saldo;

  set saldo(double saldo) {
    if (saldo <= 0) {
      // generar una excepcion
      throw Exception('El saldo no puede ser negativo');
    }

    _saldo = saldo;
  }

  // double getSaldo() {
  //   return _saldo;
  // }

  // void setSaldo(double saldo) {
  //   this._saldo = saldo;
  // }
}
