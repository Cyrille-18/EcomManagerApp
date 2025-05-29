import 'package:flutter/material.dart';
import 'package:maplenou/widgets/BottomNavbar.dart';

class AddproductScreen extends StatefulWidget {
  const AddproductScreen({super.key});

  @override
  State<AddproductScreen> createState() => _AddproductScreenState();
}

class _AddproductScreenState extends State<AddproductScreen> {
  int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: Bottomnavbar(currentIndex: _selectedIndex),
    );
  }
}