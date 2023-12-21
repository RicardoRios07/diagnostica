import 'package:flutter/material.dart';
import 'formulario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Prueba Diagnóstica Flutter'),
        ),
        body: Center(
          child: MiFormulario(),
        ),
      ),
    );
  }
}