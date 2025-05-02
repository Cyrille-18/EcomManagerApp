import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
      child: Container(
        height: 40, // 🔹 Plus compacte
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F7), // Très léger contraste avec le fond
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: const Color(0xFFEDEDED), width: 0.8), // 🔹 Bordure subtile
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.search, color: Colors.grey, size: 20),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
                cursorColor: Colors.black45,
                decoration: const InputDecoration(
                  hintText: "Rechercher une commande...",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 13.5),
                  border: InputBorder.none,
                  isCollapsed: true, // 🔹 Réduit la hauteur interne
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
