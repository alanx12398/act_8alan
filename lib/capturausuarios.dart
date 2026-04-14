import 'package:flutter/material.dart';
import 'guardardatosdiccionario.dart';

class CapturaUsuariosScreen extends StatefulWidget {
  const CapturaUsuariosScreen({super.key});

  @override
  State<CapturaUsuariosScreen> createState() => _CapturaUsuariosScreenState();
}

class _CapturaUsuariosScreenState extends State<CapturaUsuariosScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _contrasenaController = TextEditingController();
  final _confirmarContrasenaController = TextEditingController(); // 4to dato capturado

  void _guardarUsuario() {
    if (_formKey.currentState!.validate()) {
      // Guardar a través del agente
      GuardarDatosDiccionario.guardarUsuario(
        nombre: _nombreController.text,
        correo: _correoController.text,
        contrasena: _contrasenaController.text,
      );

      // Limpiar formulario y dar retroalimentación
      _nombreController.clear();
      _correoController.clear();
      _contrasenaController.clear();
      _confirmarContrasenaController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 8),
              Text('Usuario guardado con éxito!'),
            ],
          ),
          backgroundColor: Colors.green.shade600,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _correoController.dispose();
    _contrasenaController.dispose();
    _confirmarContrasenaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: const Text('Capturar Usuario (4 datos)', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF4F46E5),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ],
          ),
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Nuevo Usuario',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                _buildTextField(
                  controller: _nombreController,
                  label: 'Nombre completo',
                  icon: Icons.person_outline,
                  validator: (value) => value!.isEmpty ? 'El nombre es requerido' : null,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _correoController,
                  label: 'Correo electrónico',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value!.isEmpty || !value.contains('@') ? 'Ingrese un correo válido' : null,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _contrasenaController,
                  label: 'Contraseña',
                  icon: Icons.lock_outline,
                  obscureText: true,
                  validator: (value) => value!.isEmpty ? 'La contraseña es requerida' : null,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _confirmarContrasenaController, // Cuarto dato capturado en form
                  label: 'Confirmar Contraseña',
                  icon: Icons.lock_reset,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) return 'Confirme la contraseña';
                    if (value != _contrasenaController.text) return 'Las contraseñas no coinciden';
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    onPressed: _guardarUsuario,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4F46E5),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      'Guardar Usuario',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF6B7280)),
        filled: true,
        fillColor: const Color(0xFFF9FAFB),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF4F46E5), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
      ),
    );
  }
}
