import 'package:flutter/material.dart';
import 'package:app_practica/pages/pagina_perfil.dart';
import 'package:app_practica/pages/home_page.dart';
import 'package:app_practica/pages/personal_page.dart';
import 'package:app_practica/pages/widget_video_page.dart';
import '../models/persona.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const HomePage(),
    '/perfil': (BuildContext context) => const PaginaPerfil(),
    '/video': (BuildContext context) => VideoPage(),
  };
}

// Opciones para rutas con argumentos
Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  final routeBuilders = {
    '/personal': (BuildContext context) {
      final persona = settings.arguments as Persona;
      return PersonalPage(persona: persona);
    },
  };

  final builder = routeBuilders[settings.name];
  if (builder != null) {
    return MaterialPageRoute(builder: builder);
  }

  // Ruta por defecto si no se encuentra
  return MaterialPageRoute(
    builder: (_) => const Scaffold(
      body: Center(child: Text("Ruta no trobada")),
    ),
  );
}
