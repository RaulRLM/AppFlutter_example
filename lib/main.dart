import 'package:flutter/material.dart';
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding
        .ensureInitialized(); // Necessari per inicialitzar plugins // probar de borrar
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SPPMM',
      themeAnimationDuration: Durations.extralong1,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: getRoutes(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
