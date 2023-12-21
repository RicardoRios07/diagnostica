class Persona {
  String nombre;
  String apellido;
  int edad;

  Persona({required this.nombre, required this.apellido, required this.edad});

  factory Persona.conEdad({required String nombre, required String apellido, required int edad}) {
    return Persona(nombre: nombre, apellido: apellido, edad: edad);
  }

  @override
  String toString() {
    return '$nombre $apellido - Edad: $edad años';
  }
}