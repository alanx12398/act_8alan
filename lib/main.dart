import 'package:flutter/material.dart';
import 'inicio.dart';
import 'capturausuarios.dart';
import 'verusuarios.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Datos de Usuarios',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4F46E5)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InicioScreen(),
        '/captura': (context) => const CapturaUsuariosScreen(),
        '/ver': (context) => const VerUsuariosScreen(),
      },
    );
  }
}
