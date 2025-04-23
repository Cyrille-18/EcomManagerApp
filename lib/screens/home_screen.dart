import 'package:flutter/material.dart';
import 'package:maplenou/widgets/BottomNavbar.dart';
import 'package:maplenou/widgets/MyAppbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; //use for bottom navigation bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Myappbar(),
      body: const Center(
        child: Text('Bienvenue sur Maplenou'),
      ),
      bottomNavigationBar: Bottomnavbar(currentIndex: _selectedIndex),
    );
  }
}
