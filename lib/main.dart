import 'package:flutter/material.dart';
import 'package:maplenou/screens/home_screen.dart';
import 'package:maplenou/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maplenou',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: appRoutes,
    );
  }
}
