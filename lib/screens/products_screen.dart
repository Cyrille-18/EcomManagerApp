import 'package:flutter/material.dart';
import 'package:maplenou/screens/addproduct_screen.dart';
import 'package:maplenou/widgets/MyAppbar.dart';
import 'package:maplenou/widgets/searchbar.dart';

import '../widgets/BottomNavbar.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _selectedIndex = 2;
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  MyAppBar(

        title: "Liste des produits",
        centerTitle: false,
        actionIcon: Icons.add_box_outlined,
        onActionPressed: (){
          Navigator.push(context , MaterialPageRoute(
            builder: (context) => const AddproductScreen(),
          ));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               
          ],
        ),
      ),
      bottomNavigationBar: Bottomnavbar(currentIndex: _selectedIndex),
    );
  }
}