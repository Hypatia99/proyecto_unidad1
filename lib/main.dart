import 'package:flutter/material.dart';
import 'package:proyecto_unidad1/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //quitar la madre del debug pq me estorbaba
      title: 'peliculas',
      initialRoute: 'home',
      routes: {'home': (_) => HomeScreen(), 'details': (_) => DetailScreen()},
    );
  }
}
