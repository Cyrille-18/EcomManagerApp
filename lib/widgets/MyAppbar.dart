import 'package:flutter/material.dart';

class Myappbar extends StatelessWidget implements PreferredSizeWidget {
  const Myappbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black87),
        onPressed: () {},
      ),
      title: const Text(
        'Maplenou',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.person_outline, color: Colors.black87),
          onPressed: () {},
        ),
      ],
    );
  }
}
