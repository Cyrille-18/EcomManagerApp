import 'package:flutter/material.dart';
import 'package:maplenou/widgets/BottomNavbar.dart';
import 'package:maplenou/widgets/MyAppbar.dart';
import 'package:maplenou/widgets/addcategoryform.dart';

class AddcategoryScreen extends StatefulWidget {
  const AddcategoryScreen({super.key});

  @override
  State<AddcategoryScreen> createState() => _AddcategoryScreenState();
}

class _AddcategoryScreenState extends State<AddcategoryScreen> {
  int _selectedIndex = 3;

  void _handleSubmit(
      String name, String description, String status, String? imagePath) {
    // Logique de création de la catégorie (ex: envoi à une API)
    // ignore: avoid_print
    print("Catégorie: $name - $description - $status - $imagePath");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: MyAppBar(
        title: "Créer une categorie",
        centerTitle: false,
        leadingIcon: Icons.arrow_back,
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: AddCategoryForm(onSubmit: _handleSubmit),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Bottomnavbar(currentIndex: _selectedIndex),
    );
  }
}
