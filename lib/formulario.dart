import 'package:flutter/material.dart';
import 'persona.dart'; // Importa la clase Persona

class MiFormulario extends StatefulWidget {
  const MiFormulario({Key? key}) : super(key: key);

  @override
  _MiFormularioState createState() => _MiFormularioState();
}

class _MiFormularioState extends State<MiFormulario> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController edadController = TextEditingController();

  Persona? usuario; // Nuevo: Almacena los datos del usuario

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa el nombre';
                }
                if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                  return 'Ingresa solo letras';
                }
                return null;
              },
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: edadController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Edad'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa la edad';
                }
                if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                  return 'Ingresa solo números';
                }
                return null;
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  String nombre = nombreController.text;
                  int edad = int.parse(edadController.text);
                  setState(() {
                    usuario = Persona(nombre: nombre, apellido: '', edad: edad);
                  });
                  _mostrarModal();
                }
              },
              child: const Text('Mostrar Datos'),
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Datos del usuario'),
          content: Text(
            usuario != null
                ? 'Hola, soy ${usuario!.nombre} y tengo ${usuario!.edad} años :)'
                : 'No se ingresaron datos del usuario',
            style: const TextStyle(
              color: Colors.blue, // Color azul
              fontSize: 18.0,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}