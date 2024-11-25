import 'package:flutter/material.dart';
import '../models/persona.dart';

class PersonalPage extends StatefulWidget {
  final Persona persona;

  const PersonalPage({super.key, required this.persona});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  late TextEditingController nomController;
  late TextEditingController cognomController;
  late TextEditingController dataNaixementController;
  late TextEditingController correuController;
  late TextEditingController contrasenyaController;

  @override
  void initState() {
    super.initState();
    // Inicializar los controladores con los valores de la persona
    nomController = TextEditingController(text: widget.persona.nom);
    cognomController = TextEditingController(text: widget.persona.cognom);
    dataNaixementController =
        TextEditingController(text: widget.persona.dataNaixement);
    correuController = TextEditingController(text: widget.persona.correu);
    contrasenyaController =
        TextEditingController(text: widget.persona.contrasenya);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Persona"),
        backgroundColor: const Color(0xFF00C4B4),
      ),
      backgroundColor: const Color(0xFF181A20),
      resizeToAvoidBottomInset:
          true, // Permite que la pantalla se ajuste al mostrar el teclado
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Campo para el nombre
              _crearTextField(
                controller: nomController,
                label: "Nom",
              ),
              const SizedBox(height: 10),

              // Campo para los apellidos
              _crearTextField(
                controller: cognomController,
                label: "Cognom",
              ),
              const SizedBox(height: 10),

              // Campo para la fecha de nacimiento
              _crearTextField(
                controller: dataNaixementController,
                label: "Data de Naixement",
              ),
              const SizedBox(height: 10),

              // Campo para el correo electrónico
              _crearTextField(
                controller: correuController,
                label: "Correu Electrònic",
              ),
              const SizedBox(height: 10),

              // Campo para la contraseña
              _crearTextField(
                controller: contrasenyaController,
                label: "Contrasenya",
                obscureText: true,
              ),
              const SizedBox(height: 20),

              // Botón para guardar
              ElevatedButton(
                onPressed: () {
                  // Al presionar el botón "Desa", se devuelve un nuevo objeto Persona
                  Navigator.pop(
                    context,
                    Persona(
                      nom: nomController.text,
                      cognom: cognomController.text,
                      dataNaixement: dataNaixementController.text,
                      correu: correuController.text,
                      contrasenya: contrasenyaController.text,
                    ),
                  );
                },
                child: const Text("Desa"),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF00C4B4), // Color del fondo del botón
                  padding: const EdgeInsets.symmetric(
                      vertical: 15), // Padding del botón
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Función para crear los campos de texto (TextField) para cada campo
  Widget _crearTextField({
    required TextEditingController controller,
    required String label,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white), // Estilo del texto
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
