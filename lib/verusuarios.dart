import 'package:flutter/material.dart';
import 'diccionariousuario.dart';

class VerUsuariosScreen extends StatelessWidget {
  const VerUsuariosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarios = datousuario.values.toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: const Text('Usuarios Registrados', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF4F46E5),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: usuarios.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inbox_rounded, size: 80, color: Colors.grey.shade400),
                  const SizedBox(height: 16),
                  Text(
                    'No hay usuarios registrados',
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: usuarios.length,
              itemBuilder: (context, index) {
                final user = usuarios[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFFE0E7FF),
                      foregroundColor: const Color(0xFF4F46E5),
                      radius: 28,
                      child: Text(
                        user.id.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    title: Text(
                      user.nombre,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.email_outlined, size: 16, color: Color(0xFF6B7280)),
                              const SizedBox(width: 6),
                              Text(user.correo, style: const TextStyle(color: Color(0xFF4B5563))),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.lock_outline, size: 16, color: Color(0xFF6B7280)),
                              const SizedBox(width: 6),
                              Text(user.contrasena, style: const TextStyle(color: Color(0xFF4B5563))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
