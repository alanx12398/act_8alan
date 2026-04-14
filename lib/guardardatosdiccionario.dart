import 'claseusuario.dart';
import 'diccionariousuario.dart';

class GuardarDatosDiccionario {
  // Id autonumérico interno
  static int _siguienteId = 1;

  static void guardarUsuario({
    required String nombre,
    required String correo,
    required String contrasena,
  }) {
    // Se utiliza el id autonumérico
    int id = _siguienteId++;
    
    // Crear el objeto usuario
    Usuario nuevoUsuario = Usuario(
      id: id,
      nombre: nombre,
      correo: correo,
      contrasena: contrasena,
    );

    // Guardar en el diccionario global
    datousuario[id] = nuevoUsuario;
  }
}
