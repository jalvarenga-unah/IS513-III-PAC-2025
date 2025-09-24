class CuentaBancaria {
  // propieades

  final String titular;
  final int numeroCuenta;
  final String tipoCuenta;

  // propiedad privada
  double _saldo = 0;

  // Firma (constructor)
  CuentaBancaria({
    required this.titular,
    required this.numeroCuenta,
    this.tipoCuenta = 'Ahorros',
  });

  // constructor con nombre
  CuentaBancaria.plazoFijo({
    required this.titular,
    required this.numeroCuenta,
    this.tipoCuenta = 'Plazo Fijo',
  });

  CuentaBancaria.cuentaEmpresarial({
    required this.titular,
    required this.numeroCuenta,
    required this.tipoCuenta,
  });

  // constructor factory
  factory CuentaBancaria.fromJson(Map<String, dynamic> datos) {
    return CuentaBancaria(
      titular: datos['titular'],
      numeroCuenta: datos['numeroCuenta'],
      tipoCuenta: datos['tipoCuenta'],
    );
  }

  // comportamientos / funciones o metodos

  double deposito(double monto) {
    if (monto <= 0) {
      // generar una excepcion
      throw Exception('El monto del deposito debe ser positivo');
    }

    saldo += monto;
    return saldo;
  }

  double retiro(double monto) {
    if (monto <= 0) {
      // generar una excepcion
      throw Exception('El monto del retiro debe ser positivo');
    }

    if (monto > saldo) {
      // generar una excepcion
      throw Exception('No hay saldo suficiente');
    }

    saldo -= monto;
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

  @override
  String toString() {
    return 'Titula: $titular, Numero de Cuenta: $numeroCuenta, Tipo de Cuenta: $tipoCuenta';
  }
}
