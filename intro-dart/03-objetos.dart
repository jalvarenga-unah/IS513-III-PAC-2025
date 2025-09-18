void main() {
  //mapas

  // objetos de tipo clave / valor
  final Map<String, dynamic> mascota = {
    'nombre': 'Apolo',
    'edad': 3,
    'vacunas': ['rabia', 'parvovirus', 'moquillo'],
  };

  print(mascota['nombre']);
  print(mascota['edad']);
  print(mascota['vacunas'][2]);

  // se debe tipar de forma estricta el Mapa
  final Map<String, dynamic> user = {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {"lat": "-37.3159", "lng": "81.1496"},
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets",
    },
  };

  print(user['company']['name']);
}
