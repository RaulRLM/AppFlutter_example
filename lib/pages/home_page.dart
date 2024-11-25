import 'package:flutter/material.dart';
import '../models/persona.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Persona? personaRebuda;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SPPMM"),
        backgroundColor: const Color(0xFF00C4B4),
      ),
      backgroundColor: const Color(0xFF181A20),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.icecream_rounded,
              size: 100,
              color: Colors.pinkAccent,
            ),
            const Text(
              "Pagina d'inici",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final personaInicial = Persona(
                  nom: "Raül",
                  cognom: "Lama",
                  dataNaixement: "03/03/1990",
                  correu: "raul@example.com",
                  contrasenya: "12345",
                );
                // Navegar a PersonalPage con argumentos
                final resultat = await Navigator.pushNamed(
                  context,
                  '/personal', // Nombre de la ruta en texto
                  arguments: personaInicial,
                );
                if (resultat is Persona) {
                  setState(() {
                    personaRebuda = resultat;
                  });
                }
              },
              child: const Text("Anar a Personal Page"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/video');
              },
              child: const Text("Anar a Video Page"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/perfil');
              },
              child: const Text("Pagina Perfil"),
            ),
            if (personaRebuda != null)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Persona modificada: ${personaRebuda!.nom}",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
