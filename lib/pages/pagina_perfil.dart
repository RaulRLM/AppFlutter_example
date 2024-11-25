import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaginaPerfil extends StatelessWidget {
  const PaginaPerfil({Key? key}) : super(key: key);

  Future<void> _launchURL(String url) async {
    try {
      // Asegúrate de que la URL esté correctamente formateada como Uri
      Uri uri = Uri.parse(url); // Usamos la URL que se pasa como parámetro
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        print('No se puede abrir la URL');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Color(0xFF00C4B4),
      ),
      backgroundColor: const Color(0xFF181A20),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Imagen del perfil
              const CircleAvatar(
                radius: 140,
                backgroundImage: NetworkImage(
                  'https://raullam.github.io/miWeb/assets/images/heri.jpg',
                ),
              ),
              const SizedBox(height: 40),
              // Botón "Hello I'm"
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF00C4B4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Hello I'm",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Raül Lama',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Fullstack Developer',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              // Redes sociales
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      _launchURL('https://www.youtube.com/');
                    },
                    icon: const FaIcon(FontAwesomeIcons.youtube),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {
                      _launchURL('https://github.com/');
                    },
                    icon: const FaIcon(FontAwesomeIcons.github),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {
                      _launchURL('https://www.linkedin.com/');
                    },
                    icon: const FaIcon(FontAwesomeIcons.linkedin),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {
                      _launchURL('https://dev.to/');
                    },
                    icon: const FaIcon(FontAwesomeIcons.facebook),
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
