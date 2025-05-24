import 'package:flutter/material.dart';
import 'package:maplenou/data/sample_category.dart';
import 'package:maplenou/widgets/BottomNavbar.dart';
import 'package:maplenou/widgets/MyAppbar.dart';
import 'package:maplenou/widgets/category_card.dart';
import 'package:maplenou/models/category.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int _selectedIndex = 3;
  List<Category> categories = sampleCategories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: MyAppBar(
        title: "Catégories",
        subtitle: "Gérer vos catégories de produits",
        centerTitle: false,
        actionIcon: Icons.add_circle_outline_rounded,
        actionIconSize: 30,
        onActionPressed: () {
          Navigator.pushNamed(context, '/addcategory');
        },
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          return CategoryCard(
            category: cat,
            onEdit: () {},
            onDelete: () {
              setState(() {
                categories.removeAt(index);
              });
            },
            onTap: () {},
          );
        },
      ),
      bottomNavigationBar: Bottomnavbar(currentIndex: _selectedIndex),
    );
  }
}
