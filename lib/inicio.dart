import 'package:flutter/material.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: const Text('Inicio', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF4F46E5),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.people_alt_rounded,
                size: 100,
                color: Color(0xFF4F46E5),
              ),
              const SizedBox(height: 40),
              _buildModernButton(
                context,
                title: 'Capturar Usuarios',
                icon: Icons.person_add_alt_1_rounded,
                routeName: '/captura',
              ),
              const SizedBox(height: 20),
              _buildModernButton(
                context,
                title: 'Ver Usuarios',
                icon: Icons.list_alt_rounded,
                routeName: '/ver',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModernButton(BuildContext context, {required String title, required IconData icon, required String routeName}) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
        icon: Icon(icon, size: 28),
        label: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4F46E5),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          shadowColor: const Color(0xFF4F46E5).withOpacity(0.5),
        ),
      ),
    );
  }
}
